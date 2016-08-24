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
"Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'gregsexton/MatchTag' 
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/auto_autoread.vim'
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin on           "required by nerdcommenter

" Put plugins and dictionaries in this dir
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

"to see the generated characters corresponding to a command, run 'sed -n l' in
"terminal
syntax enable
set background=dark
colorscheme solarized 
set backspace=indent,eol,start
set rnu
set number
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set wmh=0
set shortmess=at
set cursorline
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l> 
" Show matching brackets.
set showmatch 
" update files when switching to different git branches
set autoread 
" show the line number on the bar
set ruler 
set t_Co=256
"autocmd vimenter * NERDTree
"move line above or below altj and alt-k
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
"move current line above or below
vnoremap ˚ :m '<-2<CR>gv=gv
nnoremap ∆ :m .+1<CR>==
"swap : with ;
nnoremap ; :
nnoremap : ;
"copy to clip board with yy and paste with p
nnoremap "*y yy 
vnoremap "*y yy
nnoremap "*p p
nnoremap "*p p
" remap :update (save) to space button in normal mode
noremap <space> :update<CR>
" remap switching between panes from ctrl-ww to tab
nnoremap <Tab> <c-w>w
set ic                       "case insensitive search by default
"no annoying sound on errors
set noerrorbells 
set novisualbell
hi Directory guifg=#FF0000 ctermfg=white

set noswapfile        "no swap file creation

"--------------------Leader-----------------------------------"
let mapleader = ","
"remap \cc to ,l to comment code
nnoremap <Leader>l :call NERDComment(0<Leader>"toggle")<CR>
vnoremap <Leader>l :call NERDComment(0<Leader>"toggle")<CR>
nnoremap ,o :CtrlP<CR>
" select All using leader-a
nnoremap <Leader>a ggVG
map <Leader> <Plug>(easymotion-prefix)
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p

" search and replace a word under cursor
nnoremap <Leader>r :%s/<C-r><C-w>/<C-r><C-w>/gc<C-f>$F/i
nnoremap <Leader>t :NERDTreeToggle<CR>

function! NumberToggle()
  if(&relativenumber == 1 && &number == 1)
    set number
    set norelativenumber
  elseif (&number == 1 && &relativenumber == 0)
    set norelativenumber
    set nonumber
  else
    set number
    set relativenumber
  endif
endfunc

nnoremap <Leader>n :call NumberToggle()<CR>
nnoremap <Leader>c <Insert>console.log();<esc><left><Insert>
"-----------------End of Leader declarations----------------------------"

"give handlebars html syntax highlighting
au BufReadPost *.hbs set syntax=html
au BufNewFile,BufRead *.xml,*.hbs set ft=html "let vim assume hbs filetype is html
" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

"Autoread when file is edtited elsewhere
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w

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
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
"remap arrow key to resize split window
nnoremap <left> <C-w><
nnoremap <right> <C-w>>
nnoremap <up> <C-w>+
nnoremap <down> <C-w>-


"let g:user_emmet_leader_key='<C-Z>'   "change Emment command to ctrl-z
inoremap <S-Tab> <c-y>,

set wildignore+=*/node_modules/*  "ignore node_modules folder in fuzzy finder

"when I type func turn it into function
"iabbr func function
"iabbr conso console.log("

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
"when entering a { it will close it, enter a new line and put the cursor
"withcorrect indentation
set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
