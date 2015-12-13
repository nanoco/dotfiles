#!/bin/bash

DOT_FILES=( zsh zshrc zshenv gitconfig vimrc vim tmux.conf bashrc)

for file in ${DOT_FILES[@]}
do
  ln -fs $HOME/.dotfiles/$file $HOME/.$file
done


