" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.


"-----------------------GENERAL-------------------
"
" Usefull sources:
" -Python
"   https://github.com/mbrochh/vim-as-a-python-ide

" -C / C++
" http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
"
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" force vim to sources .vimrc file into the current directory and do it
" securely
"set exrc
"set secure

" Global def, theme, color, etc
runtime! debian.vim
call pathogen#infect()
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

filetype plugin indent on 


"set background=dark
colorscheme busybee 
set guifont=DejaVu\ Sans\ Mono\ 15

" Line Numbers
syntax on
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn guibg=#2d2d2d ctermbg=0

vmap Q gq
nmap Q gqap

" Usefull things
set history=500
set undolevels=700

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" better copy & paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" mouse and backspace
set mouse=a
set bs=2

" Rebind <Leader> key
let mapleader = ","



nnoremap <S-j> <PageUp>
nnoremap <S-k> <PageDown>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Rebind for saving
" Note you should add stty -ixon in your .bashrc or .zshrc
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

" Rebind for quit
noremap <C-q> :quit<CR>

" Rebind for tab
map <Leader>t <esc>:tabnew<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"Moving code block
vnoremap <S-tab> <gv
vnoremap <tab> >gv

"plugins (in .vim/bundle)
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
set t_Co=256

" git clone git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 10

" Cool plugin to comment block of code
" https://github.com/scrooloose/nerdcommenter
"  <leader>c<space>     =>      Toggle comment
"  <leader>ci           =>      Invert comment
"  <leader>cs           =>      Sexy way

"-----------------------python---------------------
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" Python folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


"-----------------------C - C++--------------------
" git clone https://github.com/Valloric/YouCompleteMe.git
" cd YouCompleteMe
" git submodule update --init --recursive
" ./install.sh --clang-completer
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0

nnoremap <Leader>j :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>k :YcmCompleter GoToDeclaration<CR>

