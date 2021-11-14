-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require("packer").startup({function()
  -- Packer can manage itself
  use 'lewis6991/impatient.nvim'
  use {'wbthomason/packer.nvim'}

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  
  -- Improve movements
  -- Vertical Movement
  use 'justinmk/vim-sneak'
  -- Horizontal movement
  use 'hrsh7th/vim-eft'

  -- Colorshemes
  use 'diegoquiroz/github-nvim-theme'

  -- TODO: define which indent guide plugin to use
  -- Indent lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Comment Code
  use 'tpope/vim-commentary'

  -- Align columns
  --use 'godlygeek/tabular'

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    run = 'cd app && yarn install'
  }
  -- Side bar
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-tree').setup {} end
  }
  
  -- Bottom line for Vim
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'windwp/floatline.nvim',
    config = function() require('floatline').setup() end
  }

  -- Keep correct size of windows
  use {
    "kwkarlwang/bufresize.nvim",
    config = function()
        -- require("bufresize").setup()
    end
  }

  -- Login screen
  -- use {
  --   'goolord/alpha-nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' },
  --   config = function ()
  --       require('alpha').setup(require('alpha.themes.dashboard').opts)
  --   end
  -- }

  -- Fuzzy finder for vim
  --use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Project management
  use {
    'nvim-telescope/telescope-project.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }

  -- Git stuff
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 50
        }
      }
    end
  }

  use 'tpope/vim-fugitive'

  -- Add tmux navigation shortcuts to vim
  use 'christoomey/vim-tmux-navigator'
  -- Language Server Protocol
  use {
    'hrsh7th/nvim-cmp',
    opt = true,
    ft = {
      'python',
      'javascript',
      'php',
      'go',
      'json',
      'html',
      'css',
      'vue',
      'lua',
      'proto'
    },
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function()
      require('lsp')
      require('completion')
    end
  }

  use "lukas-reineke/cmp-rg"

  -- Cool error/diagnostics list
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup{}
    end
  }

  -- Comments plugin
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{}
    end
  }

  -- Python
  -- Jupyter Notebooks
  --use 'bfredl/nvim-ipy'

  -- HTML plugins
  --use 'mattn/emmet-vim'

  -- Pair characters plugin
  use 'windwp/nvim-autopairs'
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
  use {'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- Simple plugins can be specified as strings
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'romgrk/nvim-treesitter-context'

  --[[
  NOTE: 
  Lazy loading:
  -- Load on specific commands
  --]]
  use {'tweekmonster/startuptime.vim', opt = true, cmd = {'Start'}}
  use {'nvim-treesitter/playground', opt = true, cmd = {'Playground'}}


end,
config = {
  compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
}})