#!/bin/bash

set -e


dep="htop vim tmux wget git curl python3-pip zsh"
if [[ $EUID -eq 0 ]]; then
   	apt update && apt install $dep -y
else
   	sudo  apt update && sudo apt install $dep -y
fi


git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && mkdir -p ~/.vim/{bundle,autoload}

vim -c 'PluginInstall' -c 'qa!' > /dev/null 2>&1

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/jjungo/tmux-config.git \
    && ./tmux-config/install.sh


export TERM=xterm-256color
