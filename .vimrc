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
Plugin 'scrooloose/nerdcommenter'
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
"move line above or below altj and alt-k
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
"copy to clip board with yy
nnoremap "*y yy 
vnoremap "*y yy
" remap :w save to space button in normal mode
nnoremap <space> :w<CR> 
" select All using alt-a
"nnoremap å ggVG
"case insensitive search by default
set ic 
set noerrorbells "no annoying sound on errors
set novisualbell
hi Directory guifg=#FF0000 ctermfg=white
"when entering a { it will close it, enter a new line and put the cursor
"withcorrect indentation
set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>
"required by nerdcommenter
filetype plugin on 
"remap \cc to alt+/ to comment code
nnoremap ,c :call NERDComment(0,"toggle")<CR>
vnoremap ,c :call NERDComment(0,"toggle")<CR>
"give handlebars html syntax highlighting
au BufReadPost *.hbs set syntax=html
"F1 to toggle between pasting with correct indentation when in inset mode
"set pastetoggle=<F1>
"paste with correct indentation when in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
