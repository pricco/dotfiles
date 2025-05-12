return {
  'stevearc/aerial.nvim',
  lazy_load = true,
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup({
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
      layout = {
        min_width = 30,
      },
    })
    vim.keymap.set('n', '<leader>at', '<cmd>AerialToggle!<CR>')
    vim.keymap.set('n', '<leader>an', '<cmd>AerialNavToggle<CR>')
  end,
}
