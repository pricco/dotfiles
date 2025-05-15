vim.scriptencoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.opt.mouse = ''
vim.opt.termguicolors = true
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.laststatus = 3

vim.opt.shortmess:append('filmnrxoOtTI')
vim.opt.backspace = { 'indent', 'eol', 'start' }

vim.opt.wrap = false
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]'
vim.opt.linespace = 0
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.cmdheight = 1
vim.opt.cursorline = true
vim.opt.showbreak = '↪'
vim.opt.virtualedit = 'onemore'
vim.opt.visualbell = false
vim.opt.showmode = false
vim.opt.viewoptions = { 'folds', 'options', 'cursor', 'unix', 'slash' }
vim.opt.hidden = true
vim.opt.foldenable = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.o.swapfile = false
vim.opt.showmatch = true
vim.opt.list = true
vim.opt.listchars = { tab = '› ', trail = '•', extends = '#', nbsp = '.' }
vim.opt.wildmenu = true
vim.opt.wildmode = { 'list', 'longest', 'full' }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 15
vim.opt.scrolljump = 1
vim.opt.scrolloff = 5
vim.opt.winminheight = 0
vim.wo.signcolumn = 'yes'
vim.opt.number = true
vim.opt.showcmd = true
vim.o.completeopt = 'menuone,noselect'
vim.o.pumheight = 10
vim.o.conceallevel = 0

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.timeout = true
vim.opt.timeoutlen = 200
vim.opt.ttimeoutlen = 100
vim.o.updatetime = 200

vim.opt.errorbells = false

vim.opt.spell = false
vim.opt.history = 1000

vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.joinspaces = false
