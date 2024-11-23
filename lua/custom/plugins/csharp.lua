return {
  'iabdelkareem/csharp.nvim',
  dependencies = {
    'williamboman/mason.nvim', -- Required, automatically installs omnisharp
    'mfussenegger/nvim-dap',
    'Tastyep/structlog.nvim', -- Optional, but highly recommended for debugging
  },
  config = function()
    require('mason').setup() -- Mason setup must run before csharp, only if you want to use omnisharp
    require('csharp').setup {
      lsp = {
        enable_editor_config_support = true,
        enable_analyzers_support = true,
        load_projects_on_demand = true,
        organize_imports = true,
        roslyn = {
          enable_analyzers_support = true,
          enable_import_completion = true,
        },
      },
    }
  end,
}
