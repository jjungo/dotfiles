#!/bin/bash

##this script provide a way to install vim as python2/3 and C, C++ ide

sudo apt-get install libx11-dev libxt-dev



hg clone https://vim.googlecode.com/hg/ vim

./configure --enable-pythoninterp \
    --enable-python3interp \
    --enable-perlinterp \
    --enable-rubyinterp \
    --enable-luainterp \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --enable-multibyte \
    --with-x \
    --prefix=/usr \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ 

make VIMRUNTIMEDIR=/usr/share/vim/vim74 && sudo make install    


which vim
vim --version
