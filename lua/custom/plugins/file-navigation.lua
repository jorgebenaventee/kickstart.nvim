return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '<leader>oi', function()
      local oil = require 'oil'
      oil.open_float()
    end, { desc = 'Open in Oil' })
  end,
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
