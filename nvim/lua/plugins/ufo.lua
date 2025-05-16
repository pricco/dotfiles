return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    require('ufo').setup({
      provider_selector = function(_, _, _)
        return { 'treesitter', 'indent' }
      end,
    })

    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.opt.fillchars = {
      foldopen = '', -- abierto (⯆)
      foldclose = '', -- cerrado (⯈)
      fold = ' ', -- lo que llena el espacio del fold
    }
  end,
}
