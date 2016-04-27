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

"to see the generated characted corresponding to a command, run 'sed -n l' in
"terminal
syntax enable
set background=dark
colorscheme solarized 
set backspace=indent,eol,indent
"set rnu
set number
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch  " Show matching brackets."
set ruler      " show the line number on the bar"
"move line above or below
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv"move current line above or below
nnoremap ∆ :m .+1<CR>==
"swap : with ;
nnoremap ; :
nnoremap : ;
set noerrorbells "no annoying sound on errors
set novisualbell
hi Directory guifg=#FF0000 ctermfg=white
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'solarized'

