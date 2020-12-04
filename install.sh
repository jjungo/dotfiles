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

cp .aliases .bashrc .vimrc ~/
echo "Install vim plugin..."
vim -u ~/.vimrc -c 'PluginInstall' -c 'qa!'

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .zshrc ~/

git clone https://github.com/jjungo/tmux-config.git /tmp/tmux-config\
    && /tmp/tmux-config/install.sh
rm -rf /tmp/tmux-config


export TERM=xterm-256color
