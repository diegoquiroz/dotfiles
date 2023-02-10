-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require("packer").startup({function()
  -- Packer can manage itself
  use 'lewis6991/impatient.nvim'
  use {'wbthomason/packer.nvim'}

  use {'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons'}
  
  -- Improve movements
  -- Vertical Movement
  use 'ggandor/lightspeed.nvim'
  -- use 'justinmk/vim-sneak'
  -- Horizontal movement
  use 'hrsh7th/vim-eft'

  -- Colorshemes
  -- use 'diegoquiroz/github-nvim-theme'
  use 'projekt0n/github-nvim-theme'
  use 'ellisonleao/gruvbox.nvim'
  use 'Mofiqul/dracula.nvim'
  use ({'rose-pine/neovim', as = 'rose-pine'})

  -- TODO: define which indent guide plugin to use
  -- Indent lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Comment Code
  use 'tpope/vim-commentary'

  -- Align columns
  use 'junegunn/vim-easy-align'
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
  }
  
  -- Bottom line for Vim
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
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
          delay = 50,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
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
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'php',
      'go',
      'json',
      'html',
      'css',
      'vue',
      'lua',
      'proto',
      'terraform',
      'c',
      'rust'
    },
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'rafamadriz/friendly-snippets',

      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-calc',

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
  use {
    'hkupty/iron.nvim',
    config = function()
      require('iron.core').setup {
        config = {
          preferred = {
            python = "ipython"
          }
        }
      }
    end
  }
  use 'goerz/jupytext.vim'
  use 'kana/vim-textobj-user'
  use 'GCBallesteros/vim-textobj-hydrogen'
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

  -- Fold
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Simple plugins can be specified as strings
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'romgrk/nvim-treesitter-context'

  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end
  }

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
