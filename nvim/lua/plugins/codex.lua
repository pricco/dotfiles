return {
  'johnseth97/codex.nvim',
  lazy = true,
  cmd = { 'Codex', 'CodexToggle' },
  keys = {
    {
      '<leader>cx',
      function()
        require('codex').toggle()
      end,
      desc = 'Toggle Codex',
      mode = { 'n', 't' },
    },
  },
  opts = {
    keymaps = {
      toggle = nil,
      quit = '<C-q>',
    },
    border = 'rounded',
    width = 0.8,
    height = 0.8,
    autoinstall = true,
    panel = false,
    use_buffer = false,
  },
}
