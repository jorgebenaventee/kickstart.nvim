-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.termguicolors = true

-- [[ Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })

-- Diagnostics
vim.diagnostic.config {
  virtual_text = { source = false, prefix = '●' },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Insert-mode movement (from .ideavimrc)
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move cursor left' })
vim.keymap.set('i', '<C-j>', '<C-o>gj', { desc = 'Move cursor down' })
vim.keymap.set('i', '<C-k>', '<C-o>gk', { desc = 'Move cursor up' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move cursor right' })

-- Wrapped-line movement
vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { desc = 'Down (wrapped)' })
vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { desc = 'Up (wrapped)' })

-- Buffer nav (matches IDE tab nav from .ideavimrc)
vim.keymap.set('n', '<C-h>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-l>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-w>a', '<cmd>%bd|e#|bd#<CR>', { desc = 'Close all buffers but current' })
vim.keymap.set('n', '<C-F4>', '<cmd>bp|bd #<CR>', { desc = 'Close current buffer' })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Bootstrap lazy.nvim ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = { { import = 'plugins' } },
  ui = { icons = vim.g.have_nerd_font and {} or nil },
}

-- vim: ts=2 sts=2 sw=2 et
