local function get_mini_icon(ctx)
  if ctx.source_name == "Path" then
    local is_unknown_type =
      vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
    local mini_icon, mini_hl, _ =
      require("mini.icons").get(is_unknown_type and "os" or ctx.item.data.type, is_unknown_type and "" or ctx.label)
    if mini_icon then
      return mini_icon, mini_hl
    end
  end
  local mini_icon, mini_hl, _ = require("mini.icons").get("lsp", ctx.kind)
  return mini_icon, mini_hl
end

return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, kind_hl = get_mini_icon(ctx)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl = get_mini_icon(ctx)
                return hl
              end,
            },
            kind = {
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl = get_mini_icon(ctx)
                return hl
              end,
            },
          },
        },
      },
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
}
