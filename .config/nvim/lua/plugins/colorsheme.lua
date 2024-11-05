return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  {
    "binhtran432k/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
