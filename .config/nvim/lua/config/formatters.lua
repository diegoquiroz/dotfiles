vim.api.nvim_create_user_command("Formatters", function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  print("LSP clients with formatting:")
  for _, client in ipairs(clients) do
    if client.supports_method("textDocument/formatting") then
      print(" - " .. client.name)
    end
  end

  local conform = require("conform")
  local formatters = conform.list_formatters(0)
  print("Conform formatters:")
  for _, f in ipairs(formatters) do
    print(" - " .. f.name)
  end
end, {})
