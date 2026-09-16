return {
  'iabdelkareem/csharp.nvim', -- omnisharp LSP + debugger (netcoredbg) for C#/dotnet
  ft = { 'cs' },
  dependencies = {
    'williamboman/mason.nvim',
    'mfussenegger/nvim-dap',
    'Tastyep/structlog.nvim',
  },
  config = function()
    require('csharp').setup()
  end,
}
