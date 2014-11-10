set nocompatible

""" Automatically setting up Vundle, taken from
""" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
    let has_vundle=1
    if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
        echo "Installing Vundle..."
        echo ""
        silent !mkdir -p $HOME/.vim/bundle
        silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
        let has_vundle=0
    endif
""" }}}


filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

" Search
Plugin 'rking/ag.vim'
" Plugin 'vim-scripts/IndexedSearch'
" Plugin 'skwp/greplace.vim'
" Plugin 'Lokaltog/vim-easymotion'

" Helper
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/syntastic'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
" Plugin 'AndrewRadev/splitjoin.vim'
" Plugin 'Raimondi/delimitMate'
"" Plugin 'Shougo/neocomplete'
"" Plugin 'briandoll/change-inside-surroundings.vim'
" Plugin 'godlygeek/tabular'
" Plugin 'Keithbsmiley/investigate.vim'
"" Plugin 'bogado/file-line'
" Plugin 'mattn/webapi-vim'

" Plugin 'sjl/gundo.vim'
"" Plugin 'tomtom/tlib_vim'
" Plugin 'tpope/vim-abolish'
" Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/AnsiEsc.vim'
" Plugin 'vim-scripts/AutoTag'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/sudo.vim'
Plugin 'goldfeld/ctrlr.vim'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Appearance
Plugin 'sickill/vim-monokai'
Plugin 'jeetsukumaran/vim-numbertoggle'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'chrisbra/Colorizer'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-git' " Syntax hightlighting

" Misc
Plugin 'vim-scripts/TaskList.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'

" Python
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'

" Puppet
Plugin 'rodjek/vim-puppet' " Syntax highlighting

" CSS, Sass, Less, Stylus...
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-haml'

" Jade
Plugin 'digitaltoad/vim-jade.git'

" Tmux
Plugin 'jby/tmux.vim' " Syntax highlighing
Plugin 'christoomey/vim-tmux-navigator'

" Markdown
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'nelstrom/vim-markdown-preview'

" HTML
Plugin 'skwp/vim-html-escape'

" Node, Javascript and CofeeScript
Plugin 'briancollins/vim-jst'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'moll/vim-node'

" Games
Plugin 'amix/vim-2048'
Plugin 'mfumi/snake.vim'


call vundle#end()

""" Installing plugins the first time, quits when done {{{
    if has_vundle == 0
        :silent! PluginInstall
        :qa
    endif
""" }}}

" Disable some keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nnoremap Q <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7
set sidescrolloff=15
set sidescroll=1

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set showbreak=↪

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
" set termencoding=utf-8
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

colorscheme monokai

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set shortmess=I

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=3
set foldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <leader>f /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nmap <M-j> <C-W>j
nmap <M-k> <C-W>k
nmap <M-h> <C-W>h
nmap <M-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" for command mode
nmap <S-Tab> <<
" for insert mode
imap <S-Tab> <Esc><<i

" comment out/in
nmap <C-c> :Commentary<CR>
imap <C-c> <Esc>:Commentary<CR><<i
vmap <C-c> :Commentary<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <C-f> :Ag<space>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
" map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
" map <leader>p :setlocal paste!<cr>

vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
     buffer #
    else
     bnext
    endif

    if bufnr("%") == l:currentBufNum
     new
    endif

    if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set colorcolumn=79
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\.git$', '\.idea$', '__pycache__', '.ropeproject', '.vagrant']
let NERDTreeShowHidden=1
map <leader>n <plug>NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_console_startup=1
""let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=26
map  <S-l> :tabn<CR>
map  <S-h> :tabp<CR>
map  <S-n> :tabnew<CR>
map <F2> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_enable_python_checker=1
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode=1
let g:pymode_virtualenv=1 " Auto fix vim python paths if virtualenv enabled
let g:pymode_folding=1  " Enable python folding
let g:pymode_utils_whitespaces=0  " Do not autoremove unused whitespaces
map <Leader>rgd :call RopeGotoDefinition()<CR>
" map <Leader>pl :PyLint<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope=0
let g:pymode_rope_vim_completion=0  " use jedi-vim for completion
let g:pymode_rope_guess_project=0
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=1
let g:pymode_syntax=1
let g:pymode_syntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0
let g:pymode_syntax_highlight_self=0  " do not highlight self
let g:pymode_lint=0
let g:pymode_lint_on_write=0
let g:pymode_lint_unmodified=0
let g:pymode_lint_ignore="C0110 Exported"  " ignore pep257 missing docstring warning
let g:pymode_syntax_highlight_self=0  " do not highlight self
let g:pymode_lint_minheight=5   " Minimal height of pylint error window
let g:pymode_lint_maxheight=15  " Maximal height of pylint error window
let g:pymode_lint_mccabe_complexity=10
let g:pymode_lint_checker="pyflakes,pep8,pep257,mccabe"
let g:pymode_run_key="<leader>run"  " default key conflicts with jedi-vim
let g:pymode_doc_key="<leader>k"  " used jedi-vim for help


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jedi#goto_assignments_command="<leader>g"
let g:jedi#goto_definitions_command="<leader>d"
let g:jedi#documentation_command="K"
let g:jedi#usages_command="<leader>n"
let g:jedi#completions_command="<C-Space>"
let g:jedi#rename_command="<leader>r"
let g:jedi#show_call_signatures="1"
autocmd FileType python setlocal completeopt-=preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TaskList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local Vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:localvimrc_whitelist='/home/pricco/sophilabs/.*'
let g:localvimrc_sandbox=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching=0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'
nnoremap <leader>o :CtrlP<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-p>  :TmuxNavigatePrevious<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='_'
let g:gitgutter_sign_removed_first_line='‾'
let g:gitgutter_sign_modified_removed='*'
autocmd VimEnter,Colorscheme * :hi GitGutterAdd  ctermfg=64 ctermbg=64 cterm=NONE guifg=#46830c guibg=#46830c gui=NONE
autocmd VimEnter,Colorscheme * :hi GitGutterDelete  ctermfg=88 ctermbg=88 cterm=NONE guifg=#8b0807 guibg=#8b0807 gui=NONE
autocmd VimEnter,Colorscheme * :hi GitGutterChange  ctermfg=24 ctermbg=24 cterm=NONE guifg=#204a87 guibg=#204a87 gui=NONE
autocmd VimEnter,Colorscheme * :hi GitGutterChangeDelete  ctermfg=24 ctermbg=24 cterm=NONE guifg=#204a87 guibg=#204a87 gui=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Multiple cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NumberToggleTrigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NumberToggleTrigger='<f3>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>l :SyntasticCheck<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.html set filetype=htmldjango
" au BufNewFile,BufRead *.html set colorcolumn=-1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:session_autoload='no'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
