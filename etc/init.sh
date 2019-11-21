#!/bin/bash

DOTFILES=$HOME/dotfiles
DOTFILES_URL="https://tmp"
APP_TO_ACQUIRE="zsh vim tmux python emacs peco tig"

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

lowercase() {
    if [ $# -eq 0 ]; then
        cat <&0
    elif [ $# -eq 1 ]; then
        if [ -f "$1" -a -r "$1" ]; then
            cat "$1"
        else
            echo "$1"
        fi
    else
        return 1
    fi | tr "[:upper:]" "[:lower:]"
}

# Shell check "bash"
is_bash() {
    [ -n "$BASH_VERSION" ]
}

# Shell check "zsh"
is_zsh() {
    [ -n "$ZSH_VERSION" ]
}

# OS check "macOsX (Darwin)"
is_osx() {
    if [ "$(uname | lowercase)" == 'darwin' ]; then
        return 0
    else
        return 1
    fi
}

# OS check "Linux"
is_linux() {
    if [ "$(uname | lowercase)" == 'linux' ]; then
        return 0
    else
        return 1
    fi
}

download_apps() {
    if is_linux; then
        if [ -f /etc/debian_version ] || [ -f /etc/debian_release ]; then
            echo "Update [apt] first."
            sudo apt update -q
            echo ""

            sudo apt install -y -q $APP_TO_ACQUIRE
        fi

    elif is_osx; then

        if ! is_exists "brew"; then
            echo "Homebrew is not instaled!!!"
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            brew tap caskroom/cask
            brew cask --version
            echo ""
        fi

        brew install $APP_TO_ACQUIRE
    fi
}


echo '
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
'
echo 'Now start to install the dotfiles.'
echo ''

if [ ! -d "$dotfiles" ]; then
  if is_exists "git"; then
    git clone ${DOTFILES_URL}.git "$dotfiles"
    echo "The dofiles is installed!!!"

  elif is_exists "curl" || is_exists "wget"; then
    local zip_url=${DOTFILES_URL}/archive/master.zip

    if is_exists "curl"; then
      curl -L "$zip_url"

    elif is_exists "wget"; then
      wget -O - "$zip_url"
    fi | tar xvz

    echo 'The dofiles is installed!!!'

  else
    echo 'curl or wget required'
    exit 1
  fi

else
  echo 'Not install dotfiles cause is already installed.'
fi

echo 'Download apps to be acquired.'
download_apps

