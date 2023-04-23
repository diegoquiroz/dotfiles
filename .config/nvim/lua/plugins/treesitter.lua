return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'python',
        'javascript',
        'typescript',
        'html',
        'css',
        'php',
        'rust',
        'go',
        'yaml',
        'toml',
        'c',
        'lua'
      },
      sync_install = false,
      highlight = {
        enable = true
      },
      indent = {
        disable = { 'yaml' }
      },
      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
      },
      autopairs = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      }
    }
  end
}
