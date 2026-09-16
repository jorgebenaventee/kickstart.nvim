return {
  'stevearc/oil.nvim',
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  opts = {},
  config = function()
    require('oil').setup {}
    vim.keymap.set('n', '<leader>oi', '<cmd>Oil<CR>', { desc = 'Open Oil file explorer' })
  end,
}
