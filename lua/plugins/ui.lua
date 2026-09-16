return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = { theme = 'catppuccin', globalstatus = true },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
      },
    },
  },
  { 'folke/which-key.nvim', event = 'VimEnter', opts = {} },
  { 'folke/trouble.nvim', cmd = 'Trouble', opts = {} },
}
