let mapleader = ','
let g:mapleader = ','
let g:maplocalleader = ','
nnoremap x "_x
vnoremap x "_x
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap H :<C-u>help<Space><C-r><C-w><CR>
vnoremap <silent> <C-p> "0p<CR>
xnoremap <TAB>  >gv
xnoremap <S-TAB>  <gv
nnoremap P P=']

" =============================================================================
" move
" =============================================================================
vnoremap j gj
vnoremap k gk
nnoremap <C-u> 5<C-y>
nnoremap <C-d> 5<C-e>
nnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-a> ^
vnoremap <C-e> $
noremap j gj
noremap k gk
map w <Plug>(smartword-w)
map b <Plug>(smartword-b)
map e <Plug>(smartword-e)
map ge <Plug>(smartword-ge)

" =============================================================================
"search
" =============================================================================
nmap n <Plug>(anzu-n)zz
nmap N <Plug>(anzu-N)zz
nmap * <Plug>(anzu-star)zz
nmap # <Plug>(anzu-sharp)zz
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
vnoremap * "zy:let @/ = @z<CR>n

vnoremap v $h

noremap : ;

" =============================================================================
" semicoron
" =============================================================================
nnoremap [scoron] <Nop>
nmap ; [scoron]
noremap [scoron]: :
nnoremap <silent> [scoron]w :w<CR>
nnoremap <silent> [scoron]d :BD<CR>
nnoremap <silent> [scoron]q :q<CR>
nnoremap <silent> [scoron]W :w!<CR>
nnoremap <silent> [scoron]D :BD!<CR>
nnoremap <silent> [scoron]Q :q!<CR>
nnoremap <silent> [scoron]; :<C-u>Unite buffer<CR>

" =============================================================================
" space
" =============================================================================
nnoremap [Space] <Nop>
xnoremap [Space] <Nop>
nmap <Space> [Space]
xmap <Space> [Space]

" search
nnoremap <silent> [Space]/ :<C-u>call toggle_option#execute('hlsearch')<CR>
nnoremap <silent> [Space]c :<C-u>call toggle_option#execute('cursorline')<CR>
nnoremap <silent> [Space]d :<C-u>CD<CR>
nnoremap <silent> [Space]v :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> [Space]g :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> [Space]s
  \ :<C-u>source $MYVIMRC\| if has('gui_running') \|source $MYGVIMRC \| endif<CR>

" quickhl
nmap [Space]ht <Plug>(quickhl-manual-this)
xmap [Space]ht <Plug>(quickhl-manual-this)
nmap [Space]hr <Plug>(quickhl-manual-reset)
xmap [Space]hr <Plug>(quickhl-manual-reset)
nmap [Space]hw <Plug>(quickhl-cword-toggle)

" memolist
map [Space]ml :MemoList<CR>
map [Space]mn :MemoNew<CR>
map [Space]mg :MemoGrep<CR>

" yankround
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)

" memolist
command! -nargs=0 KobitoAdd execute 'silent !open -a Kobito.app ' . expand('%:p')
command! -nargs=? -bar MyMemoNew :call memolist#new(<q-args>)|w|KobitoAdd
nnoremap [Space]mn :<C-u>MyMemoNew<CR>
nnoremap [Space]ml :<C-u>MemoList<CR>
nnoremap [Space]mg :<C-u>MemoGrep<CR>

" choosewin
nmap [Space]w <Plug>(choosewin)

" =============================================================================
" window
" =============================================================================
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <Tab> :<C-u>ChangeWindow<CR>
nnoremap <S-Tab> <C-w>W
map <kPlus> <C-w>+
map <kMinus> <C-w>-

" =============================================================================
" unite
" =============================================================================
nnoremap [unite] <Nop>
xnoremap [unite] <Nop>
nmap f [unite]
xmap f [unite]

nnoremap <silent> <expr> <SID>(buffer-file) ':<C-u>Unite file -buffer-name=files -input=' . expand('%:p:h') . '/<CR>'
nmap <silent> [unite]f <SID>(buffer-file)
nnoremap <silent> [unite]p :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -winwidth=30 outline<CR>
nnoremap <silent> [unite]c :<C-u>Unite -no-start-insert colorscheme<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]y :<C-u>Unite -no-start-insert yankround<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_all_exit)
  nmap <buffer> q <Plug>(unite_all_exit)
  nnoremap <silent><buffer><expr> dd unite#smart_map('dd', unite#do_action('delete'))
  nmap <buffer> <C-j> <Plug>(unite_toggle_auto_preview)
  nmap <buffer><expr> s unite#mappings#set_current_filters(['sorter_word'])
endfunction

" =============================================================================
" NERDTree
" =============================================================================
let NERDTreeQuitOnOpen=1

" =============================================================================
" cmdwinEnter
" =============================================================================
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
nmap :  <sid>(command-line-enter)
xmap :  <sid>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction

" =============================================================================
" close fold
" =============================================================================
nnoremap <expr> h
      \ col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'

nnoremap <expr> l
      \ foldclosed(line('.')) != -1 ? 'zo' : 'l'


" " =============================================================================
" " QuickFixCurrentNumber
" " =============================================================================
" nnoremap Q q
" nnoremap [quickfix] <Nop>
" nnoremap q <Nop>
" nmap q [quickfix]
" 
" nmap [quickfix]q  <Plug>(QuickFixCurrentNumberGo)
" nmap [quickfix]fn <Plug>(QuickFixCurrentNumberQNext)
" nmap [quickfix]fp <Plug>(QuickFixCurrentNumberQPrev)
" nmap [quickfix]n  <Plug>(QuickFixCurrentNumberLNext)
" nmap [quickfix]p  <Plug>(QuickFixCurrentNumberLPrev)
" nmap [quickfix]fg <Plug>(QuickFixCurrentNumberQFirst)
" nmap [quickfix]fG <Plug>(QuickFixCurrentNumberQLast)
" nmap [quickfix]g  <Plug>(QuickFixCurrentNumberLFirst)
" nmap [quickfix]G  <Plug>(QuickFixCurrentNumberLLast)
