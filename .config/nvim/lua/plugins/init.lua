return {
  -- Colorshemes
  'ellisonleao/gruvbox.nvim',


  -- Comment Code
  'tpope/vim-commentary',

  -- Align columns
  'junegunn/vim-easy-align',
  --use 'godlygeek/tabular'

  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = 'cd app && yarn install'
  },

  -- Bottom line for Vim
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons', lazy = true}
  },

  -- Keep correct size of windows
  {
    "kwkarlwang/bufresize.nvim",
    config = function()
        require("bufresize").setup()
    end
  },

  -- Fuzzy finder for vim
  --use 'nvim-lua/popup.nvim'
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim'
  },

  -- Project management
  'nvim-telescope/telescope-project.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },


  -- Add tmux navigation shortcuts to vim
  'christoomey/vim-tmux-navigator',

  -- Cool error/diagnostics list
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup{}
    end
  },

  -- Comments plugin
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end
  },


  -- HTML plugins
  --use 'mattn/emmet-vim'
  -- Pair HTML tags
  'windwp/nvim-ts-autotag',

  -- Pair characters plugin
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- TODO: add configs for this
  -- use {
  --   'abecodes/tabout.nvim',
  --   config = function()
  --     require("tabout").setup({
  --       tabkey = '<Tab>',
  --       backwards_tabkey = '<S-Tab>',
  --       completion = true
  --     })
  --   end,
  --   wants = {'nvim-treesitter'}, -- or require if not used so far
  --   after = {'nvim-cmp'} 
  -- }

  -- Color hexcodes
  {'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },

  -- Fold
  -- {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},

  --[[
  NOTE: 
  Lazy loading:
  -- Load on specific commands
  --]]
  {'tweekmonster/startuptime.vim', lazy = true, cmd = {'Start'}},


}
