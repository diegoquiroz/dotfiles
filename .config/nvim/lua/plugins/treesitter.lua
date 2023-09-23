return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    ---@type TSConfig
    opts = {
      ensure_installed = {
        'python',
        'typescript',
        'javascript',
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
        -- disable = { 'yaml' },
        enable = true
      },
      playground = {
        enable = false,
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
    },
    config = function (_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    'romgrk/nvim-treesitter-context'
  }
}
