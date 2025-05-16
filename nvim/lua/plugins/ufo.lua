return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    require('ufo').setup({
      ft_ignore = {
        'neo-tree',
        'neotree',
      },
      provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
      end,
    })

    vim.o.foldcolumn = 'auto:9'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.opt.fillchars = {
      foldopen = '+',
      foldclose = '-',
      fold = ' ',
      foldsep = '│',
      eob = ' ',
    }
    vim.api.nvim_create_autocmd({ 'BufWinEnter', 'FileType' }, {
      pattern = 'neo-tree',
      callback = function()
        vim.schedule(function()
          vim.opt_local.foldcolumn = '0'
          vim.opt_local.foldenable = false
          vim.opt_local.foldmethod = 'manual'
          vim.opt_local.signcolumn = 'no'
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.statuscolumn = ''
        end)
      end,
    })
  end,
}
