HOWTO
===

This is a way to install vim as python2/3 and C/C++ ide


###Requirement

    libx11-dev
    libxt-dev
    mercurial
    build-essential
    python 
    python3
    git
    python-dev
    python3-dev
    libncurses5-dev

###Build
We must have to compile vim in order to have right options available.

    hg clone https://vim.googlecode.com/hg/ vim
    cd vim
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

    make VIMRUNTIMEDIR=/usr/share/vim/vim74 
    sudo make install    
    
    which vim
    vim --version

You may have +python +python3 +clipboard compilation's options.

###We use Vundle to manage plugins
    
    cd
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir -p ~/.vim/{bundle,autoload}

###Install my conf
Copy and place my .vimrc in your home directory

Copy and place my .vim/.ycm\_extra\_conf.py in your ~/.vim/

run `vim` and `:PluginInstall`

Finally, compile YouCompleteMe
    
    cd .vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
