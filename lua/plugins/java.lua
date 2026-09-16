return {
  { -- Java LSP + debugger + runner (jdtls under the hood)
    'nvim-java/nvim-java',
    ft = 'java',
    config = function()
      require('java').setup {}
      vim.lsp.enable 'jdtls'

      local java = require 'java'
      vim.keymap.set('n', '<leader>jr', function()
        java.runner.built_in.run_app {}
      end, { desc = 'Run Java main' })
      vim.keymap.set('n', '<leader>js', function()
        java.runner.built_in.stop_app()
      end, { desc = 'Stop Java main' })
      vim.keymap.set('n', '<leader>jl', function()
        java.runner.built_in.toggle_logs()
      end, { desc = 'Toggle Java logs' })
    end,
  },
  {
    'eatgrass/maven.nvim',
    cmd = { 'Maven', 'MavenExec' },
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      executable = 'mvn',
      commands = {
        { cmd = { 'clean', 'package' }, desc = 'clean then package' },
      },
    },
  },
}
