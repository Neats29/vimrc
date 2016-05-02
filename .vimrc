set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic' "linter
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on           "required by nerdcommenter

"to see the generated characters corresponding to a command, run 'sed -n l' in
"terminal
syntax enable
set background=dark
colorscheme solarized 
set backspace=indent,eol,start
"set rnu
set number
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch  " Show matching brackets.
set autoread   " update files when switching to different git branches
set ruler      " show the line number on the bar
"set showcmd   " display incomplete commands
"move line above or below altj and alt-k
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv "move current line above or below
nnoremap ∆ :m .+1<CR>==
"swap : with ;
nnoremap ; :
nnoremap : ;
"copy to clip board with yy and paste with p
nnoremap "*y yy 
vnoremap "*y yy
nnoremap "*p p
nnoremap "*p p
nnoremap <space> :w<CR>      " remap :w save to space button in normal mode
set ic                       "case insensitive search by default
set noerrorbells "no annoying sound on errors
set novisualbell
hi Directory guifg=#FF0000 ctermfg=white

set noswapfile        "no swap file creation

let mapleader = ","
"remap \cc to ,l to comment code
nnoremap <Leader>l :call NERDComment(0<Leader>"toggle")<CR>
vnoremap <Leader>l :call NERDComment(0<Leader>"toggle")<CR>
nnoremap ,o :CtrlP<CR>
" select All using leader-a
nnoremap <Leader>a ggVG
map <Leader> <Plug>(easymotion-prefix)

"give handlebars html syntax highlighting
au BufReadPost *.hbs set syntax=html

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

"paste with correct indentation when in insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"no arrow keys in normal, insert + visual
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

let g:user_emmet_leader_key='<C-Z>'   "change Emment command to ctrl-z

" when I type func turn it into function
iabbr func function

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
"when entering a { it will close it, enter a new line and put the cursor
"withcorrect indentation
set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>

