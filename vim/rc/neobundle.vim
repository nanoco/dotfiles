if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neomru.vim', {
      \ 'depends' : 'Shougo/unite.vim'
      \ }
NeoBundle 'kana/vim-smartword'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \    },
      \ }
NeoBundle 'sgur/unite-qf', {
      \ 'depends' : 'Shougo/unite.vim'
      \ }
NeoBundle 'appleYaks/bufkill.vim.git'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 't9md/vim-choosewin.git'
NeoBundle 'tomasr/molokai'
NeoBundle 'jelera/vim-javascript-syntax.git'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'othree/html5.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'scrooloose/syntastic'
call neobundle#end()
