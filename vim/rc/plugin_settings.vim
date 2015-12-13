" unite {{{
let g:unite_source_file_mru_limit = 200
let g:unite_enable_start_insert = 1
let g:unite_split_rule='topleft'
let g:unite_data_directory = expand(join([&directory, 'unite'], '/'))
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_grep_max_candidates = 200
let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
call unite#custom#source(
      \ 'file_rec/async', 'ignore_pattern', '\(\.png\|\.gif\|\.jpeg\|\.jpg\|\.pyc\)$')
" }}}

" matchit {{{
so $VIMRUNTIME/macros/matchit.vim
" }}}

" Indent-guides {{{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222333  gui=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#233333  gui=NONE
if 'dark' == &background
  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
else
  hi IndentGuidesOdd  ctermbg=white
  hi IndentGuidesEven ctermbg=lightgrey
endif
" }}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'], ['filename']
      \   ],
      \   'right': [
      \      ['lineinfo'], ['anzu', 'fileformat', 'fileencoding', 'filetype']
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     ['filename']
      \   ],
      \   'right': []
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'cwd' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'filename': 'MyFilename',
      \   'mode': 'MyMode',
      \   'cwd': 'MyCwd',
      \   'anzu': 'anzu#search_status',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ }

" 色の設定
let s:lightline_color = g:lightline#colorscheme#landscape#palette

let s:lightline_color.inactive.left = [ [ '#8a8a8a', '#262626', 233, 235 ], [ '#000000', '#FFFFCC', 233, 235 ] ]
let s:lightline_color.normal.middle = [ [ '#8a8a8a', '#303030', 245, 236 ] ]
let s:lightline_color.inactive.middle = [ [ '#303030', '#303030', 236, 233 ] ]
let s:lightline_color.tabline.tabsel = [ [ '#dadada', '#606060', 253, 241 ] ]
let s:lightline_color.tabline.middle = [ [ '#8a8a8a', '#303030', 245, 236  ] ]

let g:lightline#colorscheme#landscape#palette = s:lightline_color

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '⭤ ' : ''
endfunction

function! MyCwd()
  return fnamemodify(getcwd(), ":~")
endfunction

function! MyFilename()
  let l:str = ''

  if &ft == 'unite'
    let l:str = l:str . unite#get_status_string()
  else
    if '' != expand('%:t')
      let l:str = l:str . expand('%:t')
    else
      let l:str = l:str . '[No Name]'
    endif
  endif
  if '' != MyModified()
    let l:str = l:str . ' ' . MyModified()
  end

  return l:str
endfunction

function! MyMode()
  let l:mode = ''
  if lightline#mode() == 'NORMAL'
    let l:mode = '( ・ω・)'
  elseif lightline#mode() == 'INSERT'
    let l:mode = '( ｰ`дｰ´)'
  elseif lightline#mode() == 'VISUAL'
    let l:mode = '=͟͟͞͞ ( ・ω・)'
  endif
  return MyReadonly(). l:mode
endfunction
" }}}

" vim-anzu {{{
autocmd MyAutoCmd WinLeave,TabLeave * call anzu#clear_search_status()
" }}}

" auto-ctags {{{
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn', 'node_modules']
" }}}

" vim-rooter {{{
let g:rooter_use_lcd = 1
autocmd BufEnter * :Rooter
" }}}

" memolist {{{
let g:memolist_path = "~/Dropbox/vim/memolist"
let g:memolist_template_dir_path = "~/.vim/template/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d"
let g:memolist_prompt_tags = 1
let g:memolist_qfixgrep = 1
let g:memolist_filename_prefix_none = 1
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-auto-preview -start-insert"
" }}}

" choosewin {{{
let g:choosewin_overlay_enable          = 1
let g:choosewin_overlay_clear_multibyte = 1
" }}}

" BufKill {{{
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'
" }}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
