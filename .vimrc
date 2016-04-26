set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()            " required
filetype plugin indent on    " required


syntax enable
set background=dark
colorscheme delek 
set backspace=indent,eol,indent
"set rnu
set number
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
"move current line above or below
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv"move current line above or below
nnoremap <A-j> :m .+1<CR>==
nnoremap ; :
nnoremap : ;
set noerrorbells "no annoying sound on errors
set novisualbell
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'solarized'
