return {}
-- return {
--   {
--     'nvim-java/nvim-java',
--     config = function()
--       local envFile = vim.fn.getcwd() .. '/.env'
--       if vim.fn.filereadable(envFile) == 1 then
--         local env = vim.fn.readfile(envFile)
--         for _, line in ipairs(env) do
--           local key, value = line:match '([^=]*)=(.*)'
--           if key and value then
--             vim.fn.setenv(key, value)
--           end
--         end
--       end
--       require('java').setup {}
--       require('lspconfig').jdtls.setup {}
--       local java = require 'java'
--
--       vim.keymap.set('n', '<leader>jr', function()
--         java.runner.built_in.run_app {}
--       end, { desc = 'Run Java main' })
--       vim.keymap.set('n', '<leader>js', function()
--         java.runner.built_in.stop_app()
--       end, { desc = 'Stop Java main' })
--       vim.keymap.set('n', '<leader>jl', function()
--         java.runner.built_in.toggle_logs()
--       end, { desc = 'Toggle Java logs' })
--       vim.keymap.set('n', '<leader>jcd', function()
--         java.runner.built_in.config_dap()
--       end, { desc = 'Force DAP configuration' })
--
--       vim.keymap.set('n', '<leader>jRev', function()
--         java.refactor.extract_variable()
--       end, { desc = 'Extract Java variable' })
--       vim.keymap.set('n', '<leader>jReav', function()
--         java.refactor.extract_variable_all_occurrence()
--       end, { desc = 'Extract Java variable' })
--       vim.keymap.set('n', '<leader>jRec', function()
--         java.refactor.extract_constant()
--       end, { desc = 'Extract Java constant' })
--       vim.keymap.set('n', '<leader>jRem', function()
--         java.refactor.extract_constant()
--       end, { desc = 'Extract Java method' })
--       vim.keymap.set('n', '<leader>jRef', function()
--         java.refactor.extract_constant()
--       end, { desc = 'Extract Java field' })
--
--       vim.keymap.set('n', '<leader>jScr', function()
--         java.settings.change_runtime()
--       end, { desc = 'Change Java Runtime' })
--     end,
--   },
--   {
--     'eatgrass/maven.nvim',
--     cmd = { 'Maven', 'MavenExec' },
--     dependencies = 'nvim-lua/plenary.nvim',
--     config = function()
--       require('maven').setup {
--         executable = 'mvn',
--         commands = {
--           { cmd = { 'clean', 'package' }, desc = 'clean then package' },
--         },
--       }
--     end,
--   },
-- }
