execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme monokai

"nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.git$', '\.idea$']
let NERDTreeShowHidden=1
autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

"indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"folding
nnoremap <Space> za
set foldmethod=syntax                                                          
set foldnestmax=1
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
"inoremap <F9> <C-O>za
"nnoremap <F9> za
"onoremap <F9> <C-C>za
"vnoremap <F9> zf
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

"flake8
let g:flake8_max_line_length=120
autocmd BufWritePost *.py call Flake8()
"let g:flake8_ignore="E501,W293"
