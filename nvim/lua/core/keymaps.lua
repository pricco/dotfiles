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
vim.keymap.set('n', '<Tab>', ':tabn<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':tabp<CR>', opts)
vim.keymap.set('n', '<leader>x', ':tabclose<CR>', opts)     -- close buffer
vim.keymap.set('n', '<leader>t', '<cmd> tabnew <CR>', opts) -- new buffer
vim.keymap.set('n', '<M-t>', ':tabn<CR>', { noremap = true })
vim.keymap.set('i', '<M-t>', '<Esc>:tabn<CR>', { noremap = true })
vim.keymap.set('n', '<M-s>', ':wincmd w<CR>', { noremap = true })
vim.keymap.set('i', '<M-s>', '<Esc>:wincmd w<CR>', { noremap = true })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

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

--[[


-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)


-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ "n", "v" }, "<leader>y", [ ["+y] ])
vim.keymap.set("n", "<leader>Y", [ ["+Y] ])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set("n", "<leader>do", function()
	diagnostics_active = not diagnostics_active

	if diagnostics_active then
		vim.diagnostic.enable(0)
	else
		vim.diagnostic.disable(0)
	end
end)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
vim.keymap.set("n", "<leader>ss", ":mksession! .session.vim<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })
]]
