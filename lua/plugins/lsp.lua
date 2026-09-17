return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, 'Goto definition')
          map('gr', require('telescope.builtin').lsp_references, 'Goto references')
          map('gI', require('telescope.builtin').lsp_implementations, 'Goto implementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type definition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document symbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols')
          map('<leader>rn', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
          map('K', vim.lsp.buf.hover, 'Hover documentation')
          map('gD', vim.lsp.buf.declaration, 'Goto declaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf })
            end, 'Toggle inlay hints')
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- jdtls (Java) is managed by nvim-java. C# uses roslyn_ls here;
      -- csharp.nvim only provides the debugger (netcoredbg) now.
      local servers = {
        roslyn_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              hint = { enable = true },
            },
          },
        },
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },
        html = {},
        cssls = {},
        terraformls = {},
        rust_analyzer = {},
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, { 'stylua', 'prettierd', 'prettier', 'eslint_d' })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        json = { { 'prettierd', 'prettier' } },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    opts = {
      keymap = {
        preset = 'default',
        -- Enter: insert the suggestion at the cursor, keeping any text after it
        ['<CR>'] = { 'accept', 'fallback' },
        -- Tab: replace the whole word under the cursor with the suggestion (IntelliJ-style)
        ['<Tab>'] = {
          function(cmp)
            if not cmp.is_visible() then return end
            local pos = vim.api.nvim_win_get_cursor(0)
            local row, col = pos[1], pos[2]
            local line = vim.api.nvim_get_current_line()
            local trailing = line:sub(col + 1):match '^[%w_]*'
            if trailing ~= '' then vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col + #trailing, {}) end
            return cmp.select_and_accept()
          end,
          'snippet_forward',
          'fallback',
        },
      },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true },
    },
    opts_extend = { 'sources.default' },
  },
}
