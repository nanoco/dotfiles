## PROMPT内で変数展開・コマンド置換・算術演算を実行する。
setopt prompt_subst
## PROMPT内で「%」文字から始まる置換機能を有効にする。
setopt prompt_percent
## コピペしやすいようにコマンド実行後は右プロンプトを消す。
setopt transient_rprompt

## 256色生成用便利関数
color256()
{
    local red=$1; shift
    local green=$2; shift
    local blue=$3; shift

    echo -n $[$red * 36 + $green * 6 + $blue + 16]
}

fg256()
{
    echo -n $'\e[38;5;'$(color256 "$@")"m"
}

bg256()
{
    echo -n $'\e[48;5;'$(color256 "$@")"m"
}

## プロンプトの作成
## バージョン管理システムの情報も表示する
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
    '[%{%F{blue}%}%s:%b%{%f%}]'
zstyle ':vcs_info:*' actionformats \
    '[%s@%{%F{white}%K{blue}%}%b%{%f%k%}|%{%F{white}%K{red}%}%a%{%f%k%}]'

###   %{%B%}...%{%b%}: 「...」を太字にする。
###   %{%F{cyan}%}...%{%f%}: 「...」をシアン色の文字にする。
###   %{%k%}: 背景色を元に戻す。
###   %{%f%}: 文字の色を元に戻す。
###   %{%b%}: 太字を元に戻す。

### 上プロンプトバーの左側
prompt_bar_left_self="[%{%B%F{green}%}%n%{%b%f%}%{%F{cyan}%}@%{%f%}%{%B%F{green}%}%M%{%b%f%}]"
prompt_bar_left="┌─${prompt_bar_left_self}"

### 上プロンプトバーの右側
#prompt_bar_right="-[%{%B%F{magenta}%}%~%{%b%f%}]-"
prompt_bar_right="-[%{%B%F{magenta}%}%~%{%b%f%}][%D{%F %I:%M:%S}]-"

### 下プロンプトバーの左側
#prompt_left="-%{%B%}%#%{%b%} "
#prompt_left="-%{%B%}%(!.#.$)%{%b%} "
prompt_left="└─>%{%B%}%(!.#.$)%{%b%} "

### 下右プロンプト
prompt_right=""

## プロンプトフォーマットを展開した後の文字数を返す。
## 日本語未対応。
count_prompt_characters()
{
    print -n -P -- "$1" | sed -e $'s/\e\[[0-9;]*m//g' | wc -m | sed -e 's/ //g'
}

## プロンプトを更新する。
update_prompt()
{
    # プロンプトバーの左側の文字数を数える。
    local bar_left_length=$(count_prompt_characters "$prompt_bar_left")
    # プロンプトバーに使える残り文字を計算する。
    # $COLUMNSにはターミナルの横幅が入っている。
    local bar_rest_length=$[COLUMNS - bar_left_length]

    local bar_left="$prompt_bar_left"
    # パスに展開される「%d」を削除。
    local bar_right_without_path="${prompt_bar_right:s/%d//}"
    # 「%d」を抜いた文字数を計算する。
    local bar_right_without_path_length=$(count_prompt_characters "$bar_right_without_path")
    # パスの最大長を計算する。
    local max_path_length=$[bar_rest_length - bar_right_without_path_length]
    # パスに展開される「%d」に最大文字数制限をつける。
    bar_right=${prompt_bar_right:s/%d/%(C,%${max_path_length}<...<%d%<<,)/}
    # 「${bar_rest_length}」文字分の「-」を作っている。
    local separator="${(l:${bar_rest_length}::-:)}"
    # プロンプトバー全体を「${bar_rest_length}」カラム分にする。
    bar_right="%${bar_rest_length}<<${separator}${bar_right}%<<"
    # プロンプトバーと左プロンプトを設定
    PROMPT="${bar_left}${bar_right}"$'\n'"${prompt_left}"
    # 下右プロンプト
    RPROMPT="${prompt_right}"
    case "$TERM_PROGRAM" in
    Apple_Terminal)
      RPROMPT="${RPROMPT}-"
      ;;
    esac

    # バージョン管理システムの情報を取得する。
    LANG=C vcs_info >&/dev/null
    # バージョン管理システムの情報があったら右プロンプトに表示する。
    if [ -n "$vcs_info_msg_0_" ]; then
      RPROMPT="${vcs_info_msg_0_}-${RPROMPT}"
    fi
}

## コマンド実行前に呼び出されるフック。
precmd_functions=($precmd_functions update_prompt)


#setopt prompt_subst
#autoload colors
#colors
#
#autoload add-zsh-hook
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable hg git bzr svn
#zstyle ':vcs_info:*' formats '%u' '%S' '%s' '%b'
#zstyle ':vcs_info:*' actionformats '%u' '%S' '%s' '%b|%a'
#zstyle ':vcs_info:hg*:netbeans' use-simple true
#zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch
#
#function hg_branch_name_cutdown() {
#  str=`hg prompt "{branch}" 2> /dev/null | sed -e "s/develop/d/g"\
#                       -e "s/integration/i/g"\
#                       -e "s/private/p/g"\
#                       -e "s/issue/is/g"\
#                       -e "s/hotfix/h/g"\
#                       -e "s/feature/f/g"`
#  vcs_info_msg_branch_=${str}
#}
#
#precmd_vcs_info () {
#  psvar=()
#  LANG=en_US.UTF-8 vcs_info
#  repos=`print -nD "$vcs_info_msg_0_"`
#  unset psvar
#  if [[ $vcs_info_msg_2_ == "hg" ]]; then
#    [[ -n "$vcs_info_msg_1_" ]] && psvar[1]=$vcs_info_msg_1_
#    hg_branch_name_cutdown
#    [[ -n "$vcs_info_msg_1_" ]] && psvar[2]=$vcs_info_msg_2_
#    [[ -n "$vcs_info_msg_1_" ]] && psvar[3]=$vcs_info_msg_branch_
##    [[ -n "$vcs_info_msg_1_" ]] && psvar[4]=`hg prompt "{[out+{outgoing|count}]}" 2> /dev/null`
#  else
#    [[ -n "$vcs_info_msg_1_" ]] && psvar[1]="$vcs_info_msg_1_"
#    [[ -n "$vcs_info_msg_1_" ]] && psvar[2]="$vcs_info_msg_2_"
#    [[ -n "$vcs_info_msg_1_" ]] && psvar[3]="$vcs_info_msg_3_"
#  fi
#}
#typeset -ga precmd_functions
#precmd_functions+=precmd_vcs_info
#
#add-zsh-hook precmd mikeh_precmd
#
#mikeh_precmd() {
#    vcs_info
#}
#PROMPT='%{$fg[green]%}%n@%M%{$reset_color%}\
#%1(v|-[%{$fg[blue]%}%2v%{$reset_color%}]-[%{$fg[blue]%}%3v%{$reset_color%}]%4(v|%4v|)|)
#%{$fg[red]%}%(!.#.>) %{$reset_color%}'
#
#echo 'load prompt.zsh'
#
##%4(v|-[%{$fg[blue]%}%1v%{$reset_color%}]-[%{$fg[blue]%}%3v%{$reset_color%}]|)
