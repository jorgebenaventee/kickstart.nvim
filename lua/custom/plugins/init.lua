-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.filetype.add {
  pattern = {
    ['.*.component.html'] = 'angular.html', -- Sets the filetype to `angular.html` if it matches the pattern
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'angular.html',
  callback = function()
    vim.treesitter.language.register('angular', 'angular.html') -- Register the filetype with treesitter for the `angular` language/parser
  end,
})

return {
  {
    'joeveiga/ng.nvim',
    init = function()
      local ng = require 'ng'
      vim.keymap.set('n', '<leader>at', ng.goto_template_for_component, { noremap = true, silent = true, desc = 'Go to template for component' })
      vim.keymap.set('n', '<leader>aT', ng.get_template_tcb, { noremap = true, silent = true, desc = 'Get template typecheck block' })
      vim.keymap.set('n', '<leader>ac', ng.goto_component_with_template_file, { noremap = true, silent = true, desc = 'Go to component with template file' })
    end,
  },
}
