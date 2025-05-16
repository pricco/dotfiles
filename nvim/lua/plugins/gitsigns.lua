return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '󱇬' },
        change = { text = '' },
        delete = { text = '󱘹' },
        topdelete = { text = '󱘹' },
        changedelete = { text = '󰦒' },
        untracked = { text = '' },
      },
      signs_staged = {
        add = { text = '󱇬' },
        change = { text = '' },
        delete = { text = '󱘹' },
        topdelete = { text = '󱘹' },
        changedelete = { text = '󰦒' },
        untracked = { text = '' },
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame<cr>', opts)
  end,
}
