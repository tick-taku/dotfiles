# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac


## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[blue]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[cyan]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[cyan]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[cyan]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# 'cd'を打たなくてもディレクトリ名だけで移動できるようにする
#
setopt auto_cd

# ディレクトリ移動時に自動でpushdされる 'cd -<TAB>' で履歴が表示される
# 'cd -3'とかするとその番号のディレクトリに移動する
#
setopt auto_pushd

# コマンドの打ち間違い(typo)を訂正してくれるようにする
#
setopt correct

# TAB補完時の候補を詰めて表示(一度にたくさん表示)
#
setopt list_packed

# パス名の最後につく'/'を自動的に削除しない
#
setopt noautoremoveslash

# 補完機能実行時にビープ音を鳴らさない
#
setopt nolistbeep


## キーバインドの設定
#
# <ESC>を押した時にvi風のキー操作ができるようにする
#
# bindkey -v
bindkey -e
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# bindkey ";5C" forward-word
# bindkey ";5D" backward-word

# コマンド履歴の検索時に <Ctrl-p>で履歴をさかのぼり、<Ctrl-n>で履歴を下る
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# <TAB>での補完候補の変更時に、<Shift-TAB>で逆順に変更する
#
bindkey "\e[Z" reverse-menu-complete


## コマンド履歴の設定
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # 重複したコマンドは履歴保存しない
setopt share_history        # コマンド履歴ファイルを複数のzshプロセス間で共有
setopt hist_no_store        # history コマンドは履歴に残さない

## コマンド履歴を全件表示
function history-all { history -E 1 }

## 補完機能の設定
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit        # 補完機能を有効にする
compinit -u


## zsh editorを有効にする
#
autoload zed


## 先方予測によるコマンド補完機能の設定
#  (使いこなせないので無効しとく)
#autoload predict-on
#predict-off


## コマンドエイリアスの設定
#
setopt complete_aliases     # エイリアスを展開してもとのコマンドをみつけて, そのコマンドに応じた補完

alias where="command -v"
#alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

# alias la="ls -a"
# alias lf="ls -F"
# alias ll="ls -l"
# alias lla="ls -la"
alias ll="ls -la"

# alias du="du -h"
# alias df="df -h"

# alias su="su -l"

## ターミナルの設定
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# ターミナルの時はタイトル部分にカレントディレクトリを表示する
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


## ユーザ定義の設定ファイル読み込み (個人設定の適用)
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine


### for Fitix auto start
(fcitx-autostart > /dev/null 2>&1 &)

