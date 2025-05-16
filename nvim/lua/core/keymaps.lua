vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

-- Disable keys
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'i' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'i' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'i' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'i' }, '<Right>', '<Nop>')
vim.keymap.set('n', 'Q', '<Nop>')
vim.keymap.set('n', '<Space>', '<Nop>')

-- Move between Tab & Split
vim.keymap.set('n', '<Tab>', '<cmd>tabn<CR>', opts)
vim.keymap.set('n', '<S-Tab>', '<cmd>tabp<CR>', opts)
vim.keymap.set('n', '<leader>x', '<cmd>tabclose<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>t', '<cmd> tabnew <CR>', opts) -- new buffer
vim.keymap.set('n', '<M-t>', '<cmd>tabn<CR>', { noremap = true })
vim.keymap.set('i', '<M-t>', '<Esc><cmd>tabn<CR>', { noremap = true })
vim.keymap.set('n', '<M-s>', '<cmd>wincmd w<CR>', { noremap = true })
vim.keymap.set('i', '<M-s>', '<Esc><cmd>wincmd w<CR>', { noremap = true })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', '<cmd>close<CR>', opts) -- close current split window

-- Save
vim.keymap.set('n', '<leader>w', '<cmd> w <CR>', opts) -- save
vim.keymap.set('n', '<leader>nw', '<cmd>noautocmd w <CR>', opts)

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
