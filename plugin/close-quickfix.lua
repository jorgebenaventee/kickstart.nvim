vim.keymap.set('n', '<leader>qfc', function()
  vim.cmd 'cclose'
end, { desc = 'Close quickfix window' })
