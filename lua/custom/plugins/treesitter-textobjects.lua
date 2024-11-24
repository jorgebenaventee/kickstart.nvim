return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
    }
  end,
}
