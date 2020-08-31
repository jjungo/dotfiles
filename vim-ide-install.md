# HOWTO


This is a way to install vim as python2/3 and C/C++ ide


### Requirement

    sudo apt-get install libx11-dev \
    libxt-dev \
    build-essential \
    python \
    python3 \
    git \
    python-dev \
    python3-dev \
    libncurses5-dev \
    cmake

### Build
We must have to compile vim in order to have right options available.

    git clone https://github.com/vim/vim
        cd vim
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
        --prefix=/usr/local

    make VIMRUNTIMEDIR=/usr/share/vim/vim80
    sudo make install

    which vim
    vim --version

You may have +python +python3 +clipboard compilation's options.

### We use Vundle to manage plugins

    cd
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir -p ~/.vim/{bundle,autoload}

### Install my conf

Copy and place my .vimrc in your home directory

Copy and place my .vim/.ycm\_extra\_conf.py in your ~/.vim/

run `vim` and `:PluginInstall`

Finally, compile YouCompleteMe

    cd .vim/bundle/YouCompleteMe
    ./install.py --clang-completer
