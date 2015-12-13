typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path

path=(
  /Users/nanoco/homebrew/bin(N-/)
  /Users/nanoco/homebrew/opt/coreutils/libexec/gnubin(N-/)
  ${path}
  )

export ZSH=$HOME/.zsh

# vim: expandtab softtabstop=2 shiftwidth=2
# vim: foldmethod=marker
