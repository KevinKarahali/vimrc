set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2

let g:prettier#autoformat = 0

au BufNewFile,BufRead *.ejs set filetype=html

call plug#begin('~/.vim/plugged')"Plugins
Plug 'pangloss/vim-javascript' "java script support
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim' "control+y+,
Plug 'posva/vim-vue'
call plug#end()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let NERDTreeQuitOnOpen=1

"atajos de teclado 
let mapleader =" "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>s <Plug>(easymotion-s)
nmap <Leader>nt :NERDTreeFind<CR> 
nmap  <Leader>p :Prettier<CR>
:imap º <Esc>
