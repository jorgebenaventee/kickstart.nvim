return {
  'echasnovski/mini.files',
  opts = {},
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    local window = vim.api.nvim_get_current_win()
    local window_width = vim.api.nvim_win_get_width(window)
    require('mini.files').setup {
      windows = { preview = true, width_preview = window_width * 0.5 },
    }
    vim.keymap.set('n', '<leader>oi', function()
      MiniFiles.open()
    end, { desc = 'Open file tree' })
  end,
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
