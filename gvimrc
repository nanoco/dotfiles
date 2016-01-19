if has('win32')
  set guifont=MS_Gothic:h10:cSHIFTJIS
  set linespace=1
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  "set guifont=Ricty:h14
  set guifont=Ricty\ for\ Powerline:h18
elseif has('xfontset')
  set guifontset=a14,r14,k14
endif

colorscheme molokai
so ~/.vim/colors/custom.vim

set columns=120     " ウインドウの幅
set lines=70        " ウインドウの高さ
set cmdheight=2     " コマンドラインの高さ(GUI使用時)
set transparency=3  " 透明度を指定
set guioptions-=T   " ツールバーなし
set guioptions-=m   " メニューバーなし
set guioptions-=r   " 右スクロールバーなし
set guioptions-=R
set guioptions-=l   " 左スクロールバーなし
set guioptions-=L
set guioptions-=b   " 下スクロールバーなし
set guioptions-=e   " テキストベースのタブラインを使う

if has('multi_byte_ime') || has('xim')
  set iminsert=0 imsearch=0
endif
set mouse=a
set nomousefocus
set mousehide
set visualbell

if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

nnoremap <silent> [Space]i :<C-u>call g:toggle_option('imdisableactivate')<CR>
nnoremap <silent> [Space]f :set fullscreen<CR>

if !exists('s:loaded_my_gvimrc')
  let s:loaded_my_gvimrc = 1
endif
