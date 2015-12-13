alias d='dirs -v'
alias h='hg'
alias ls='ls --color=tty'
alias ll='ls -l -G'
alias la='ls -al -G'
alias ld='ls -dl .*'
alias mv='mv -iv'
alias refresh='source $HOME/.zshenv;source $HOME/.zshrc'
alias keyboardoff='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
alias keyboardon='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
alias -g V="| vim -R -"
alias -g M="| mview -"
alias -g G="| grep"
alias -g NE='2> /dev/null'
alias -g X='|xargs'
alias -g XG='|xargs grep'
alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'

function chpwd() { ls }
