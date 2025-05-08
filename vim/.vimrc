" .vimrc {
" vim: set sw=4 ts=4 sts=4 et foldmarker={,} foldlevel=1 foldmethod=marker nospell:
" }
" Environment {
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
" }

" Plugins {
    set nocompatible
    filetype off

    " Set the runtime path to include Plug and initialize
    call plug#begin('~/.vim/plugged')

    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'sheerun/vim-polyglot' " https://github.com/sheerun/vim-polyglot

    Plug 'tpope/vim-git' " https://github.com/tpope/vim-git
    Plug 'tacahiroy/ctrlp-funky' " https://github.com/tacahiroy/ctrlp-funky
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} " https://github.com/mg979/vim-visual-multi

    " SLOW?
    " Plug 'nathanaelkane/vim-indent-guides'

    Plug 'mhinz/vim-signify'
    " Plug 'klen/python-mode', { 'branch': 'develop' }

    Plug 'szw/vim-ctrlspace'

    " Performance?
    " Plug 'dhruvasagar/vim-table-mode'
    " Plug 'chrisbra/csv.vim'

    Plug 'ctrlpvim/ctrlp.vim' " https://github.com/ctrlpvim/ctrlp.vim

    " Search local vimrc files (".lvimrc") in the tree (root dir up to current dir) and load them.
    " https://github.com/embear/vim-localvimrc
    Plug 'embear/vim-localvimrc'

    " This is an EditorConfig plugin for Vim.
    " https://github.com/editorconfig/editorconfig-vim
    Plug 'editorconfig/editorconfig-vim'

    " Numbers.vim is a plugin for intelligently toggling line numbers.
    " https://github.com/myusuf3/numbers.vim
    " SLOW?
    " Plug 'myusuf3/numbers.vim'

    " A tree explorer plugin for vim.
    " https://github.com/scrooloose/nerdtree
    Plug 'scrooloose/nerdtree'

    " Commentary.vim: comment stuff out
    " https://github.com/tpope/vim-commentary
    Plug 'tpope/vim-commentary'

    " Vim plugin for the Perl module / CLI script 'ack' (ag)
    " https://github.com/mileszs/ack.vim
    Plug 'mileszs/ack.vim'

    " A plugin of NERDTree showing git status flags.
    " https://github.com/Xuyuanp/nerdtree-git-plugin
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Plug 'scrooloose/syntastic'
    Plug 'benekastah/neomake'

    Plug 'tpope/vim-fugitive'

    " Plug 'majutsushi/tagbar'
    " Plug 'pangloss/vim-javascript'
    " Plug 'cakebaker/scss-syntax.vim'
    " Plug 'tpope/vim-haml'
    " Plug 'styled-components/vim-styled-components'


    " Plug 'digitaltoad/vim-jade'

    " Plug 'fatih/vim-go'

    " Set colornum based on mode

    " Plug 'Shougo/deoplete.vim'
    " Plug 'Valloric/YouCompleteMe', {'do': './install.py'}`

    " Distraction-free writing in Vim.
    " Plug 'junegunn/goyo.vim'

    " Plug 'junegunn/vim-emoji'

    " Plug 'wesQ3/vim-windowswap'
    " Plug 'wellle/context.vim'

    " echo YOUR_OPENAI_API_KEY > ~/.config/openai.token
    Plug 'madox2/vim-ai'

    call plug#end()
    filetype plugin indent on
" }

" General {

    " Disable some keys {
        map <up> <nop>
        map <down> <nop>
        map <left> <nop>
        map <right> <nop>
        imap <up> <nop>
        imap <down> <nop>
        imap <left> <nop>
        imap <right> <nop>
        nnoremap Q <nop>
        noremap <space> <nop>
        sunmap <space>
    " }

    " Behavior {
        " set t_Co=256                        " Number of colors
        scriptencoding utf-8                " Specify the character encoding used in the script.
        set fileformats=unix,dos,mac        " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit
        let mapleader = "\<Space>"          " To define a mapping which uses the mapleader variable, the special string <leader> can be used.
        set shell=/bin/sh
        set shortmess+=filmnrxoOtTI         " Abbrev. of messages (avoids 'hit enter')
        set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
        set virtualedit=onemore             " Allow for cursor beyond last character
        set history=1000                    " Store a ton of history (default is 20)
        set nospell                         " Spell checking off
        set hidden                          " Allow buffer switching without saving
        set backspace=indent,eol,start      " Backspace for dummies
        set incsearch                       " Find as you type search
        set hlsearch                        " Highlight search terms
        set ignorecase                      " Case insensitive search
        set smartcase                       " Case sensitive when uc present
        set autoindent                      " Indent at the same level of the previous line
        set shiftwidth=4                    " Use indents of 4 spaces
        set expandtab                       " Tabs are spaces, not tabs
        set tabstop=4                       " An indentation every four columns
        set softtabstop=4                   " Let backspace delete indent
        set grepprg=ag\ --nogroup\ --nocolor " Program to use for the |:grep| command.
        set timeout timeoutlen=1000 ttimeoutlen=100
        set clipboard=
        set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
        syntax enable
        set nofoldenable
        " set foldlevelstart=0

        " Backups
        set backup                          " Backups are nice ...
        if has('persistent_undo')
            set undofile                    " So is persistent undo ...
            set undolevels=1000             " Maximum number of changes that can be undone
            set undoreload=10000            " Maximum number lines to save for undo on a buffer reload
        endif

        " Initialize directories {
            " Copy from https://github.com/spf13/spf13-vim/blob/3.0/.vimrc#L1041
            function! InitializeDirectories()
                let prefix = 'vim'
                let common_dir = $HOME . '/.vim/.' . prefix
                let dir_list = {
                            \ 'backup': 'backupdir',
                            \ 'views': 'viewdir',
                            \ 'swap': 'directory' }

                if has('persistent_undo')
                    let dir_list['undo'] = 'undodir'
                endif

                for [dirname, settingname] in items(dir_list)
                    let directory = common_dir . dirname . '/'
                    if exists("*mkdir")
                        if !isdirectory(directory)
                            call mkdir(directory)
                        endif
                    endif
                    if !isdirectory(directory)
                        echo "Warning: Unable to create backup directory: " . directory
                        echo "Try: mkdir -p " . directory
                    else
                        let directory = substitute(directory, " ", "\\\\ ", "g")
                        exec "set " . settingname . "=" . directory
                    endif
                endfor
            endfunction
            call InitializeDirectories()
        " }
    " }

    " UI {
        syntax on
        if has('termguicolors')     " set true colors
            set t_8f=[38;2;%lu;%lu;%lum
            set t_8b=[48;2;%lu;%lu;%lum
            set termguicolors
        endif
        colorscheme onedark

        set nowrap                          " Do not wrap long lines
        set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too
        set showbreak=↪                     " String to put at the start of lines that have been wrapped.
        set cursorline                      " Highlight current line
        set tabpagemax=15                   " Only show 15 tabs
        set cmdheight=2                     " Number of screen lines to use for the command-line.
        set ruler                           " Show the ruler (N/A: vim-lightline)
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids (N/A: vim-lightline)
        set showcmd                         " Show partial commands in status line and Selected characters/lines in visual mode
        set showmatch                       " Show matching brackets/parenthesis
        set linespace=0                     " No extra spaces between rows (only gui)
        set number                          " Line numbers on
        set winminheight=0                  " Windows can be 0 line high
        set scrolljump=1                    " Lines to scroll when cursor leaves screen
        set scrolloff=5                     " Minimum lines to keep above and below cursor
        set sidescroll=1                    " The minimal number of columns to scroll horizontally.
        set sidescrolloff=15                " Columns on horizonal scroll
        set splitright                      " Puts new vsplit windows to the right of the current
        set splitbelow                      " Puts new split windows to the bottom of the current
        set laststatus=2
        set noshowmode                      " Display the current mode (N/A: vim-lightline)
        set wildmenu                        " Show list instead of just completing
        set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
        set list                            " Useful to see the difference between tabs and spaces and for trailing blanks.
        set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
        set pastetoggle=<F12>               " pastetoggle (sane indentation on pastes)
        set mouse=""                        " Disable mouse
        set noerrorbells                    " Disable Ring the bell (beep or screen flash) for error messages.
        set novisualbell                    " Disable visual bell
    " }

    " Keys {

        " Wrapped lines goes down/up to next row, rather than next line in file.
        " noremap j gj
        " noremap k gk

        " Visual Search {

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

            " Visual mode pressing * or # searches for the current selection
            " Super useful! From an idea by Michael Naumann
            vnoremap <silent> * :call VisualSelection('f')<CR>
            vnoremap <silent> # :call VisualSelection('b')<CR>

            " When you press gv you vimgrep after the selected text
            vnoremap <silent> gv :call VisualSelection('gv')<CR>

            " When you press <leader>r you can search and replace the selected text
            vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


        " }

        " Paste
        vmap <Leader>y "*y
        nmap <Leader>p "*p
        nmap <Leader>P "*P
        vmap <Leader>p "*p
        vmap <Leader>P "*P

        " Code folding options
        nmap <Leader>f0 :set foldlevel=0<CR>
        nmap <Leader>f1 :set foldlevel=1<CR>
        nmap <Leader>f2 :set foldlevel=2<CR>
        nmap <Leader>f3 :set foldlevel=3<CR>
        nmap <Leader>f4 :set foldlevel=4<CR>
        nmap <Leader>f5 :set foldlevel=5<CR>
        nmap <Leader>f6 :set foldlevel=6<CR>
        nmap <Leader>f7 :set foldlevel=7<CR>
        nmap <Leader>f8 :set foldlevel=8<CR>
        nmap <Leader>f9 :set foldlevel=9<CR>

        " Quick save
        nmap <leader>w :w!<CR>

        " Find merge conflict markers
        map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

        " Visual shifting (does not exit Visual mode)
        vnoremap < <gv
        vnoremap > >gv

        " Disable highlight when <leader><CR> is pressed
        map <silent> <Leader><CR> :noh<CR>

        " Close the current buffer
        map <Leader>bd :Bclose<CR>

        " Close all the buffers
        map <Leader>ba :1,1000 bd!<CR>

        " Switch CWD to the directory of the open buffer
        map <Leader>cd :cd %:p:h<CR>:pwd<CR>

        " Pressing ,ss will toggle and untoggle spell checking
        map <Leader>ss :setlocal spell!<CR>

        " Quickly open a buffer for scripbble
        map <Leader>q :e ~/buffer<CR>

        " Stop that stupid window from popping up
        map q: :q

    " }

    " Tabs {
        set showtabline=2
        if exists("+showtabline")
            function! TabLine()
                let s = ''
                let t = tabpagenr()
                let i = 1
                while i <= tabpagenr('$')
                    let buflist = tabpagebuflist(i)
                    let winnr = tabpagewinnr(i)
                    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
                    let bufnr = buflist[winnr - 1]
                    let s .= ' '
                    let file = bufname(bufnr)
                    let buftype = getbufvar(bufnr, 'buftype')
                    if buftype == 'nofile'
                        if file =~ '\/.'
                            let file = substitute(file, '.*\/\ze.', '', '')
                        endif
                    else
                        let file = fnamemodify(file, ':p:t')
                    endif
                    if file == ''
                        let file = '[No Name]'
                    endif
                    let s .= file
                    if getbufvar(bufnr, "&modified")
                        let s .= ' ±'
                    endif
                    let s .= ' '
                    let i = i + 1
                endwhile
                let s .= '%T%#TabLineFill#%='
                return s
            endfunction
            set tabline=%!TabLine()
        endif
    " }

    " Windows, Panes, Tabs and Splits {
        " Switch Tab
        set <F16>=t
        map <F16> :tabnext<CR>
        map! t <Esc>:tabnext<CR>
        " Switch Split
        set <F17>=s
        map <F17> :wincmd w<CR>
        map! <F17> <Esc>:wincmd w<CR>
    " }
" }

" lightline {
    set laststatus=2
    let g:lightline = {
      \ 'colorscheme': 'onedark',
    \ }
" }

" CtrlP {
    let g:ctrlp_regexp = 1
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'ag %s --nocolor -l -g ""'
    \ }
    " CtrlP extensions
    let g:ctrlp_extensions = ['funky']

    nnoremap <silent> <leader>o :CtrlP<CR>
    nnoremap <silent> <leader>fu :CtrlPFunky<CR>
" }

" Commentary {
    nmap <leader>cc <plug>CommentaryLine
    vmap <leader>cc <plug>Commentary
" }

 " NerdTree {
    nmap <leader>nt :NERDTreeToggle<CR>
    vmap <leader>nf :NERDTreeFind<CR>
    nmap <leader>nf :NERDTreeFind<CR>
    let g:NERDTreeShowBookmarks = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeWinSize = 26
    let g:NERDTreeMapActivateNode = "za"
    let g:NERDTreeChDirMode = 0
    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeKeepTreeInNewTab=1
    let g:NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '__pycache__', '.ropeproject', '.vagrant']

" }

" Ack {
    noremap <C-f> :Ack<space>
    let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
" }

" Local Vimrc {
    let g:localvimrc_whitelist = '/Users/pricco/projects/.*'
    let g:localvimrc_sandbox = 0
" }

" Neomake {
    let g:neomake_open_list=1
    nnoremap <leader>l :Neomake<CR>
    autocmd! BufWritePost * Neomake
    " g:neomake_error_sign* *g:neomake_warning_sign*
    " silent! if emoji#available()
    "     let g:neomake_error_sign = {
    "         \ 'text': emoji#for('warning'),
    "         \ }
    " endif
    " let g:neomake_error_sign = {'text': '🔴'}
    " let g:neomake_warning_sign = {'text': '⚠️'}
" }

" PythonMode  {
    let g:pymode = 1
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options_colorcolumn = 0
    let g:pymode_options_max_line_length = 119
    let g:pymode_indent = 1
    let g:pymode_folding = 1
    let g:pymode_motion = 0
    let g:pymode_doc = 0
    let g:pymode_virtualenv = 0
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'
    let g:pymode_run = 0
    let g:pymode_lint = 0
    let g:pymode_rope = 0
    let g:pymode_syntax = 1
    let g:pymode_syntax_slow_sync = 1
    let g:pymode_syntax_all = 1
    autocmd FileType python let &colorcolumn=join(range(80,999),",")
" }

" Indent Guides {
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_default_mapping = 0
    let g:indent_guides_auto_colors  =  0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
    nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
    highlight IndentGuidesOdd ctermbg=0
    highlight IndentGuidesEven ctermbg=0
    " highlight NonText ctermfg=8 guifg=8
" }

" EasyMotion {
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    nmap s <Plug>(easymotion-s2)
    nmap t <Plug>(easymotion-t2)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
" }

" Visual Multi {
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = '<C-n>'
    let g:VM_maps['Find Prev'] = '<C-p>'
    let g:VM_maps['Skip Region'] = '<C-x>'
    let g:VM_maps['Quit'] = '<Esc>'
" }

" Tagbar {
    nnoremap <silent> <Leader>tt :TagbarToggle<CR>
    let g:tagbar_compact = 2
    let g:tagbar_autofocus = 1
    " If using go please install the gotags program using the following
    " go install github.com/jstemmer/gotags
    " And make sure gotags is in your path
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
            \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
            \ 'r:constructor', 'f:functions' ],
        \ 'sro' : '.',
        \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
        \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
        \ }
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Git status<CR>
    nnoremap <silent> <leader>gd :Git diff<CR>
    nnoremap <silent> <leader>gc :Git commit<CR>
    nnoremap <silent> <leader>gb :Git blame<CR>
    nnoremap <silent> <leader>gl :Git log<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Git read<CR>
    nnoremap <silent> <leader>gw :Git write<CR>
    nnoremap <silent> <leader>ge :Git edit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
" }

" Signify {
    let g:signify_sign_add = '+'
    let g:signify_sign_delete_first_line = '-'
    let g:signify_sign_change = '!'
    let g:signify_sign_changedelete = '!'
    let g:signify_sign_show_count = 0

    " silent! if emoji#available()
    "     let g:signify_sign_add = emoji#for('small_blue_diamond')
    "     let g:signify_sign_delete_first_line = emoji#for('small_orange_diamond')
    "     let g:signify_sign_change = emoji#for('small_orange_diamond')
    "     let g:signify_sign_changedelete = emoji#for('collision')
    " endif
" }

" Deoplete {
    let g:deoplete#enable_at_startup = 0
" }

" Numbers {
    let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
"  }

" WindowSwap {
    let g:windowswap_map_keys = 0 "prevent default bindings
    " nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
    " nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
    nnoremap <silent> <leader>mw :call WindowSwap#EasyWindowSwap()<CR>
" }

" AI {
    " complete text on the current line or in visual selection
    nnoremap <leader>a :AI<CR>
    xnoremap <leader>a :AI<CR>
    " edit text with a custom prompt
    xnoremap <leader>e :AIEdit
    nnoremap <leader>e :AIEdit
    " trigger chat
    xnoremap <leader>c :AIChat<CR>
    nnoremap <leader>c :AIChat<CR>
    " redo last AI command
    nnoremap <leader>r :AIRedo<CR>
" }
