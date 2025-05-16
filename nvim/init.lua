require('core.options') -- Load general options
require('core.keymaps') -- Load general keymaps
require('core.snippets') -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
  require('plugins.catppucin'),
  require('plugins.trouble'),
  require('plugins.telescope'),
  require('plugins.treesitter'),
  require('plugins.lsp'),
  require('plugins.autocompletion'),
  require('plugins.lualine'),
  require('plugins.bufferline'),
  require('plugins.neotree'),
  require('plugins.alpha'),
  require('plugins.lazygit'),
  require('plugins.comment'),
  require('plugins.debug'),
  require('plugins.gitsigns'),
  require('plugins.misc'),
  require 'plugins.avante',
  require 'plugins.chatgpt',
  require('plugins.aerial'),
  require('plugins.grugfar'),
  require('plugins.ufo'),
  require('plugins.noice'),
}, {})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

-- vim.lsp.set_log_level('debug')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
