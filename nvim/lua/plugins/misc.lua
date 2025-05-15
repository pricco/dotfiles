return {
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'tpope/vim-sleuth',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'folke/which-key.nvim',
  },
  {
    -- Extensible UI for Neovim notifications and LSP progress messages.
    'j-hui/fidget.nvim',
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master',
  },
}
