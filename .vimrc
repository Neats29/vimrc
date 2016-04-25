set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required


syntax enable
colorscheme delek 
let g:airline_theme='onedark'
set backspace=indent,eol,indent
set rnu
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
