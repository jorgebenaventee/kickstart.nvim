return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
      styles = {
        comments = { 'italic' },
        keywords = { 'italic' },
      },
      integrations = {
        cmp = true,
        blink_cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true,
        mason = true,
        which_key = true,
        native_lsp = { enabled = true },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      style = 'storm',
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
  },
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    opts = { italic_comment = true },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    opts = {
      variant = 'moon',
      styles = { italic = true },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
    },
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
    },
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      options = {
        styles = {
          comments = 'italic',
          keywords = 'italic',
        },
      },
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      code_style = {
        comments = 'italic',
        keywords = 'italic',
      },
    },
  },
  {
    'neanias/everforest-nvim',
    priority = 1000,
    main = 'everforest',
    opts = { italics = true },
  },
  { -- Theme picker with live preview, persists your pick across restarts
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = {
          { name = 'Catppuccin Mocha', colorscheme = 'catppuccin-mocha' },
          { name = 'Catppuccin Macchiato', colorscheme = 'catppuccin-macchiato' },
          { name = 'Tokyonight Storm', colorscheme = 'tokyonight-storm' },
          { name = 'Tokyonight Night', colorscheme = 'tokyonight-night' },
          { name = 'Dracula', colorscheme = 'dracula' },
          { name = 'Rose Pine Moon', colorscheme = 'rose-pine-moon' },
          { name = 'Kanagawa Wave', colorscheme = 'kanagawa-wave' },
          { name = 'Kanagawa Dragon', colorscheme = 'kanagawa-dragon' },
          { name = 'Gruvbox', colorscheme = 'gruvbox' },
          { name = 'Nightfox Carbonfox', colorscheme = 'carbonfox' },
          { name = 'Nightfox Duskfox', colorscheme = 'duskfox' },
          { name = 'Onedark', colorscheme = 'onedark' },
          { name = 'Everforest', colorscheme = 'everforest' },
          'default',
          'habamax',
          'retrobox',
          'industry',
        },
        livePreview = true,
      }
    end,
    keys = {
      { '<leader>ct', '<cmd>Themery<CR>', desc = 'Choose colorscheme' },
    },
  },
}
