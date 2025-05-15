local format = {}

function format.on_attach_format_only_null_ls(client, bufnr)
  if client.name ~= 'null-ls' then
    return
  end
  if not client.supports_method('textDocument/formatting') then
    return
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('FormatOnSave_' .. bufnr, { clear = true }),
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({
        async = false,
        filter = function(format_client)
          return format_client.name == 'null-ls'
        end,
      })
    end,
  })
end

function format.disable_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },
  {
    'j-hui/fidget.nvim',
    tag = 'v1.6.1',
    config = function()
      require('fidget').setup {
        progress = {
          display = {
            done_icon = '✓',
          },
        },
        notification = {
          window = {
            winblend = 0,
          },
        },
      }
    end,
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          -- LSPs
          'bash-language-server',
          'lua-language-server',
          'vim-language-server',
          'basedpyright',

          -- Linters/formatters
          'stylua',
          'shellcheck',
          'editorconfig-checker',
          'shfmt',
          'isort',

          -- Debuggers
        },
        run_on_start = true,
        auto_update = false,
      }
    end,
  },

  -- LSPs
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason-lspconfig')
      local lspconfig = require('lspconfig')
      local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
              },
              diagnostics = { globals = { 'vim' } },
              telemetry = { enable = false },
            },
          },
        },
        basedpyright = {
          root_dir = require('lspconfig.util').root_pattern('pyrightconfig.json'),
          settings = nil,
        },
        ts_ls = {},
        bashls = {},
        jsonls = {},
      }

      for server, opts in pairs(servers) do
        opts = opts or {}
        if not opts.on_attach then
          opts.on_attach = function(client, bufnr)
            format.disable_formatting(client)
            local options = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gf', vim.lsp.buf.references, options) -- show definition, references
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options) -- got to declaration
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options) -- got to declaration
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options) -- go to implementation
            vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, options) -- show signature help
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, options) -- show signature help
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options) -- see available code actions
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options) -- smart rename
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.jump({count=-1, float=true})<CR>', options) -- jump to previous diagnostic in buffer
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.jump({count=1, float=true})<CR>', options) -- jump to next diagnostic in buffer
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, options) -- show documentation for what is under cursor
          end
        end
        opts.capabilities = capabilities
        if opts.settings and vim.tbl_isempty(opts.settings) then
          opts.settings = nil
        end
        lspconfig[server].setup(opts)
      end
    end,
  },

  -- Linters & Formatters
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      'nvimtools/none-ls.nvim',
      'nvimtools/none-ls-extras.nvim',
    },
    config = function()
      require('mason-null-ls').setup({
        automatic_installation = false,
      })

      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {
          diagnostics.checkmake,
          formatting.prettier.with({ filetypes = { 'html', 'json', 'yaml', 'markdown' } }),
          formatting.shfmt.with({ args = { '-i', '4' } }),
          formatting.stylua,
          formatting.isort,
          require('none-ls.diagnostics.ruff'),
          -- require('none-ls.formatting.ruff_format'),
        },
        on_attach = format.on_attach_format_only_null_ls,
        debug = true,
      })
    end,
  },
}

--   'neovim/nvim-lspconfig',
--   dependencies = {
--     'williamboman/mason.nvim',
--     'williamboman/mason-lspconfig.nvim',
--     'WhoIsSethDaniel/mason-tool-installer.nvim',
--     {
--       'j-hui/fidget.nvim',
--       tag = 'v1.6.1',
--       opts = {
--         progress = {
--           display = {
--             done_icon = '✓',
--           },
--         },
--         notification = {
--           window = {
--             winblend = 0,
--           },
--         },
--       },
--     },
--   },
--   config = function()
--     vim.api.nvim_create_autocmd('LspAttach', {
--       group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
--       callback = function(event)
--         local map = function(keys, func, desc)
--           vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
--         end
--         map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--         map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--         map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--         map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--         map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--         map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--         map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--         map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--         map('K', vim.lsp.buf.hover, 'Hover Documentation')
--         map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--         map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--         map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--         map('<leader>wl', function()
--           print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         end, '[W]orkspace [L]ist Folders')
--
--         -- The following two autocommands are used to highlight references of the
--         -- word under your cursor when your cursor rests there for a little while.
--         --    See `:help CursorHold` for information about when this is executed
--         --
--         -- When you move your cursor, the highlights will be cleared (the second autocommand).
--         local client = vim.lsp.get_client_by_id(event.data.client_id)
--         if client and client.server_capabilities.documentHighlightProvider then
--           vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--             buffer = event.buf,
--             callback = vim.lsp.buf.document_highlight,
--           })
--
--           vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--             buffer = event.buf,
--             callback = vim.lsp.buf.clear_references,
--           })
--         end
--       end,
--     })
--
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--     -- Enable the following language servers
--     local servers = {
--       lua_ls = {
--         -- cmd = {...},
--         -- filetypes { ...},
--         -- capabilities = {},
--         settings = {
--           Lua = {
--             runtime = { version = 'LuaJIT' },
--             workspace = {
--               checkThirdParty = false,
--               -- Tells lua_ls where to find all the Lua files that you have loaded
--               -- for your neovim configuration.
--               library = {
--                 '${3rd}/luv/library',
--                 unpack(vim.api.nvim_get_runtime_file('', true)),
--               },
--               -- If lua_ls is really slow on your computer, you can try this instead:
--               -- library = { vim.env.VIMRUNTIME },
--             },
--             completion = {
--               callSnippet = 'Replace',
--             },
--             telemetry = { enable = false },
--             diagnostics = {
--               disable = { 'missing-fields' },
--               globals = { 'vim' },
--             },
--           },
--         },
--       },
--       pylsp = {
--         settings = {
--           pylsp = {
--             plugins = {
--               pyflakes = { enabled = false },
--               pycodestyle = { enabled = false },
--               autopep8 = { enabled = false },
--               yapf = { enabled = false },
--               mccabe = { enabled = false },
--               pylsp_mypy = { enabled = false },
--               pylsp_black = { enabled = false },
--               pylsp_isort = { enabled = false },
--             },
--           },
--         },
--       },
--       -- basedpyright = {
--       --   -- Config options: https://github.com/DetachHead/basedpyright/blob/main/docs/settings.md
--       --   settings = {
--       --     basedpyright = {
--       --       disableOrganizeImports = true, -- Using Ruff's import organizer
--       --       disableLanguageServices = false,
--       --       analysis = {
--       --         ignore = { '*' },                 -- Ignore all files for analysis to exclusively use Ruff for linting
--       --         typeCheckingMode = 'off',
--       --         diagnosticMode = 'openFilesOnly', -- Only analyze open files
--       --         useLibraryCodeForTypes = true,
--       --         autoImportCompletions = true,     -- whether pyright offers auto-import completions
--       --       },
--       --     },
--       --   },
--       -- },
--       ruff = {
--         -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
--         -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
--         commands = {
--           RuffAutofix = {
--             function()
--               vim.lsp.buf.execute_command({
--                 command = 'ruff.applyAutofix',
--                 arguments = {
--                   { uri = vim.uri_from_bufnr(0) },
--                 },
--               })
--             end,
--             description = 'Ruff: Fix all auto-fixable problems',
--           },
--           RuffOrganizeImports = {
--             function()
--               vim.lsp.buf.execute_command({
--                 command = 'ruff.applyOrganizeImports',
--                 arguments = {
--                   { uri = vim.uri_from_bufnr(0) },
--                 },
--               })
--             end,
--             description = 'Ruff: Format imports',
--           },
--         },
--       },
--       jsonls = {},
--       sqlls = {},
--       yamlls = {},
--       bashls = {},
--       dockerls = {},
--       docker_compose_language_service = {},
--       -- tailwindcss = {},
--       -- graphql = {},
--       -- html = { filetypes = { 'html', 'twig', 'hbs' } },
--       -- cssls = {},
--       -- ltex = {},
--       -- texlab = {},
--     }
--
--     -- Ensure the servers and tools above are installed
--     require('mason').setup()
--
--     -- You can add other tools here that you want Mason to install
--     -- for you, so that they are available from within Neovim.
--     local ensure_installed = vim.tbl_keys(servers or {})
--     vim.list_extend(ensure_installed, {
--       'stylua', -- Used to format lua code
--     })
--     require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
--
--     require('mason-lspconfig').setup({
--       handlers = {
--         function(server_name)
--           local server = servers[server_name] or {}
--           -- This handles overriding only values explicitly passed
--           -- by the server configuration above. Useful when disabling
--           -- certain features of an LSP (for example, turning off formatting for tsserver)
--           server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--           require('lspconfig')[server_name].setup(server)
--         end,
--       },
--     })
--   end,
-- }
