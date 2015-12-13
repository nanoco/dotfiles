augroup MyAutoCmd
  autocmd!
augroup END

set encoding=utf-8

filetype plugin indent off

" neobundle
so ~/.vim/rc/neobundle.vim

filetype plugin indent on

" Set $MYVIMRC $MYGVIMRC
if has('gui_running')
  if !(has("win32") || has("win32unix"))
    let $MYVIMRC = $HOME."/.vimrc"
    let $MYGVIMRC = $HOME."/.gvimrc"
  else
    let $MYVIMRC = $HOME."/_vimrc"
    let $MYGVIMRC = $HOME."/_gvimrc"
  endif
else
  if !(has("win32") || has("win32unix"))
    let $MYVIMRC = $HOME."/.vimrc"
  else
    let $MYVIMRC = $HOME."/_vimrc"
  endif
endif

" Color setting
set t_Co=256
if !exists('g:colors_name')
  if !has('gui_running')
    syntax enable
  end
endif

" setting
so ~/.vim/rc/settings.vim

" plugins
so ~/.vim/rc/plugin_settings.vim

" command
so ~/.vim/rc/command.vim

" keymap
so ~/.vim/rc/keymap.vim

if !exists('s:loaded_my_vimrc')
  let s:loaded_my_vimrc = 1
endif

set secure

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
