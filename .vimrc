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
" turn this of if you dont use debian based OS
runtime! debian.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/BusyBee'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

syntax on

" Encoding
set termencoding=utf-8
set encoding=utf-8

"set background=dark
colorscheme BusyBee
set guifont=DejaVu\ Sans\ Mono\ 15

" Line Numbers
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn guibg=#2d2d2d ctermbg=0

vmap Q gq
nmap Q gqap

" Rebind <Leader> key
let mapleader = ","

" Usefull things
set history=500
set undolevels=700
" set show matching parenthesis
set showmatch

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

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>
nnoremap <leader>o :%s/\s\+$//<cr>

" Moving faster into the page
nnoremap <S-k> <PageUp>
nnoremap <S-j> <PageDown>
nnoremap <S-h> <Home>
nnoremap <S-l> <End>

" Removes highlight of your last search
noremap <F3> :nohl<CR>
vnoremap <F3> :nohl<CR>
inoremap <F3> :nohl<CR>

" Rebind for saving
" Note you should add stty -ixon in your .bashrc or .zshrc
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" Rebind for quit
noremap <C-q> :quit<CR>
noremap <C-q>q :quit!<CR>

" Rebind for tab
map <Leader>t <esc>:tabnew<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>q <esc>:tabclose<CR>

"Moving code block
vnoremap <S-tab> <gv
vnoremap <tab> >gv

"refresh"
map <F5> :e<CR>

"plugins (in .vim/bundle)
" git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
set t_Co=256

" git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 10

" Cool plugin to comment block of code
" https://github.com/scrooloose/nerdcommenter
"  <leader>c<space>     =>      Toggle comment
"  <leader>ci           =>      Invert comment
"  <leader>cs           =>      Sexy way

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Make Alt key work
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

set selection=inclusive

map <C-t> :NERDTreeToggle<CR>
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<c-s>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"


"-----------------------python---------------------
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#documentation_command = "<leader>d"
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" Python folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


"-----------------------C - C++--------------------
" https://github.com/Valloric/YouCompleteMe
" ./install.sh --clang-completer
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tags_files = 1

nnoremap <Leader>j :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>k :YcmCompleter GoToDeclaration<CR>

let g:DoxygenToolkit_briefTag_pre="@Brief "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_compactDoc="yes"
map <Leader>7 <esc>:Dox<CR>

map <F10> :w<CR> :!clear; make<CR> :!./%<<CR>
nmap <F9> :TagbarToggle<CR>

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "c")
    find %:t:r.h
  else
    find %:t:r.c
  endif
endfunction

:nmap <F4> :call SwitchSourceHeader()<CR>


:nnoremap <leader>g :silent execute "grep! -rin " . shellescape(expand("<cword>")) . " *.[!'swp'o]"<cr>:!clear<cr>:copen 7<cr>
:nnoremap <leader>a :silent execute "grep! -rin " . shellescape(expand("<cword>")) . " ."<cr>:!clear<cr>:copen 7<cr>
:nnoremap <leader>A :silent execute "grep! -rin " . shellescape(expand("<cWORD>")) . " ."<cr>:!clear<cr>:copen 7<cr>
:nnoremap <leader>G :silent execute "grep! -rin " . shellescape(expand("<cWORD>")) . " *.[!'swp'o]"<cr>:!clear<cr>:copen 7<cr>

:nnoremap <space>dg :diffget<space>
:nnoremap <space>du :diffupdate<CR>
:nnoremap <space>gb :Git branch<space>
:nnoremap <space>gc :Gcommit -v -q<CR>
:nnoremap <space>gd :Gdiff<CR>
:nnoremap <space>gm :Gmerge<space>
:nnoremap <space>go :Git checkout<space>
:nnoremap <space>gs :Gstatus<CR>
:nnoremap <space>gw :Gwrite<CR>

:nnoremap <A-p> :CtrlPClearAllCaches<CR>\|:CtrlP<CR>

