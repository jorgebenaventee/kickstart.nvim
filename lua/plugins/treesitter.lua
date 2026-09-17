return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- master doesn't support Neovim 0.12+
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Markdown code fences use the language tag "csharp", but the parser is named "c_sharp".
      vim.treesitter.language.register('c_sharp', 'csharp')

      local ensure_installed = {
        'bash',
        'c_sharp',
        'css',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      }

      -- The main branch compiles parsers from source and needs tree-sitter-cli for that.
      -- Install it via Mason (cross-platform) instead of requiring a manual, host-specific install.
      local function install_parsers() require('nvim-treesitter').install(ensure_installed) end

      vim.schedule(function()
        if vim.fn.executable 'tree-sitter' == 1 then
          install_parsers()
          return
        end

        local ok, registry = pcall(require, 'mason-registry')
        if not ok then
          vim.notify('tree-sitter-cli not found and mason-registry unavailable', vim.log.levels.WARN)
          return
        end

        local pkg = registry.get_package 'tree-sitter-cli'
        if pkg:is_installed() then
          install_parsers()
          return
        end

        vim.notify('Installing tree-sitter-cli via Mason...', vim.log.levels.INFO)
        pkg:install():once('closed', function() vim.schedule(install_parsers) end)
      end)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match) or event.match
          if not pcall(vim.treesitter.language.add, lang) then return end
          if not pcall(vim.treesitter.start, event.buf, lang) then return end
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = 'VeryLazy',
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = { lookahead = true },
      }

      local select = require 'nvim-treesitter-textobjects.select'
      local function map_textobject(keys, query)
        vim.keymap.set({ 'x', 'o' }, keys, function() select.select_textobject(query, 'textobjects') end)
      end

      map_textobject('af', '@function.outer')
      map_textobject('if', '@function.inner')
      map_textobject('aa', '@parameter.outer')
      map_textobject('ia', '@parameter.inner')
    end,
  },
}
