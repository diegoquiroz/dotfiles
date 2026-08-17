-- Neocodeium is a community rewrite of windsurf.vim to fix flickering
-- windsurf.nvim exists for native Nvim but Neocodeium is updated more often
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  build = ":NeoCodeium auth",
  config = function()
    local neocodeium = require("neocodeium")

    neocodeium.setup({
      manual = false,
    })

    vim.keymap.set("i", "<C-CR>", function()
      require("neocodeium").accept()
    end)
  end,
}
