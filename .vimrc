" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
execute pathogen#infect()
filetype plugin indent on
set background=dark
colorscheme solarized
set guifont=DejaVu\ Sans\ Mono\ 15
set antialias
set nocompatible
set title
set ruler
set scrolloff=3
set ignorecase
set smartcase
set incsearch
set hlsearch
set backspace=indent,eol,start
set hidden
se mouse=r
"autocmd vimenter * NERDTree


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number 

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
""set shiftwidth=4
"set omnifunc=pythoncomplete#Complete
"setlocal omnifunc=pythoncomplete#Complete
set autoindent
set smartindent
" Auto-close complete options when exiting insert mode.
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
""set completeopt=menuone   
" Sets Ctrl+Space to activate OmniComplete.
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
" Options
let OmniCpp_MayCompleteDot = 1 " complete '.'
let OmniCpp_MayCompleteArrow = 1 " complete '->'
let OmniCpp_MayCompleteScope = 1 " complete '::'
let OmniCpp_SelectFirstItem = 2 " Select first item, but don't insert.
let OmniCpp_NamespaceSearch = 2 " Search namespaces in all included files.
let OmniCpp_ShowPrototypeInAbbr = 1 " Show function prototypes in items.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete


nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

let mapleader=","
let g:CommandTSelectNextMap=['<C-n>',' <Down>']
let g:CommandTSelectPrevMap=['<C-p>', 'Up']
let g:ycm_enable_diagnostic_highlighting = 0
let g:CommandTCancelMap=['<C-c>']

