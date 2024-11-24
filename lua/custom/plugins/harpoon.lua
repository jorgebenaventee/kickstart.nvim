return {
  'theprimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>ha', function()
      require('harpoon.mark').add_file()
    end, { desc = 'Harpoon: Add File' })
    vim.keymap.set('n', '<leader>hd', function()
      require('harpoon.ui').toggle_directory()
    end, { desc = 'Harpoon: Toggle Directory' })
    vim.keymap.set('n', '<leader>hqm', function()
      require('harpoon.ui').toggle_quick_menu()
    end, { desc = 'Harpoon: Toggle Quick Menu' })
    vim.keymap.set('n', '<leader>hl', function()
      -- Show telescope picker to list all harpoon marks
      vim.cmd 'Telescope harpoon marks'
    end, { desc = 'Harpoon: List' })
    for i = 1, 9 do
      vim.keymap.set('n', '<leader>h' .. i, function()
        require('harpoon.ui').nav_file(i)
      end, { desc = 'Harpoon: Navigate to File ' .. i })
    end
    require('telescope').load_extension 'harpoon'
  end,
}
