return {
  'iabdelkareem/csharp.nvim', -- omnisharp LSP + debugger (netcoredbg) for C#/dotnet
  ft = { 'cs' },
  dependencies = {
    'williamboman/mason.nvim',
    'mfussenegger/nvim-dap',
    'Tastyep/structlog.nvim',
  },
  config = function()
    -- LSP is handled by roslyn_ls (see lsp.lua); csharp.nvim only wires up the debugger.
    require('csharp').setup {
      lsp = { omnisharp = { enable = false } },
    }
  end,
}
