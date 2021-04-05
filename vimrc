set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
"set shiftwidth=4  
"set tabstop=4 softtabstop=4
set tabstop=4 shiftwidth=4
set expandtab

set noswapfile
set smartindent
set autoindent

"set splitbelow

filetype on
filetype plugin indent on

let g:prettier#autoformat = 0

au BufNewFile,BufRead *.ejs set filetype=html
"au BufNewFile,BufRead *.php set filetype=html

call plug#begin('~/.vim/plugged')"Plugins
"Temas
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'  "TS Syntax
Plug 'pangloss/vim-javascript' "java script support
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' "Icons
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim' "control+y+,
Plug 'posva/vim-vue'
Plug 'vim-airline/vim-airline' "barra de estado
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'} "Highlighting Svelte
Plug 'preservim/nerdcommenter' "Comentar cc && cm 
Plug 'Yggdroot/indentLine'
"Plug 'sirver/ultisnips'
"Plug 'epilande/vim-react-snippets'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Revisar los que siguen no se para que sirven
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flowtype/vim-flow'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()



colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = "medium"

"para recargar usar :source %
let g:indentLine_char_list = ['¦']
"let g:indentLine_char = '¦'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let NERDTreeQuitOnOpen=1


"atajos de teclado 
let mapleader =" "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>s <Plug>(easymotion-s)
nmap <Leader>nt :NERDTreeFind<CR> 
nmap <Leader>p :Prettier<CR>
nmap <Leader>z :!
"nmap <Leader>z :!java %<CR>
nmap <Leader>fs :Files<cr>
nmap <F2> <Plug>(coc-rename)

"Java shortcuts
"
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#




"map <F9> :make<CR>
"map <F9> :make<Return>:!java -cp %:p:h %:t:r<CR>
map <F12> :make<Return>:terminal java -cp %:p:h %:t:r<CR>
"javascri
"map <F9> :terminal node %<CR>
"map <F10> :terminal deno run %<CR>
"javascri
"map <F9> :lopen<CR>
"map <F10> :lclose<CR>
"
"autocmd Filetype java set makeprg=javac\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"map <F9> :make<Return>:copen<Return>
"map <F10> :cprevious<Return>
"map <F12> :cnext<Return>

"usar tab para navegar entre los resultados de busqueda de autocompletado
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction
"Usar enter para confirmar el autocompletado y que no salte de linea
if exists('*complete_info')
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		  inoremap <expr> <cr> pumvisible)( ? "\<C-y>" : "\<C-g>u\<CR>"
		endif

"CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Identacion cuando presionas enter How can I automatically indent on new lines? vim

inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
	if pumvisible()
		 return "\<C-y>"
	 elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
		 return "\<CR>\<Esc>O"
  elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
	    return "\<CR>\<Esc>O"
			else
				return "\<CR>"
			endif
endfunction
