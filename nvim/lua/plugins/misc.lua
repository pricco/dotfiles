return {
  {
    'windwp/nvim-ts-autotag',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'folke/which-key.nvim',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
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
