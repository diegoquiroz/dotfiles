local lsp = require('lspconfig')
local configs = require('lspconfig/configs')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=false }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

lsp.intelephense.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
}
-- For python autocompletion
lsp.pylsp.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        flake8 = { enabled = true },
      }
    }
  }
}

lsp.denols.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  init_options = {
    enable = true,
    lint = true,
	format = false,
    unstable = true
  }
}

-- Golang
lsp.gopls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
}

-- JSON
lsp.jsonls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
}

-- INFO: Not changed for cmp
-- Emmet

lsp.vuels.setup{
  on_attach = on_attach,
}

-- TODO: organize this code

vim.lsp.protocol.CompletionItemKind = {
    " [text]",
    " [method]",
    " [function]",
    " [constructor]",
    "ﰠ [field]",
    " [variable]",
    " [class]",
    " [interface]",
    " [module]",
    " [property]",
    " [unit]",
    " [value]",
    " [enum]",
    " [key]",
    "﬌ [snippet]",
    " [color]",
    " [file]",
    " [reference]",
    " [folder]",
    " [enum member]",
    " [constant]",
    " [struct]",
    "⌘ [event]",
    " [operator]",
    " [type]",
}

vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticHint"})


vim.cmd[[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()]]

vim.cmd[[autocmd FileType typescript lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType typescript lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType typescript lua vim.opt.shiftwidth = 2]]
vim.cmd[[autocmd FileType javascript lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType javascript lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType javascript lua vim.opt.shiftwidth = 2]]

vim.cmd[[autocmd FileType lua lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType lua lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType lua lua vim.opt.shiftwidth = 2]]

vim.cmd[[autocmd FileType go lua vim.opt.expandtab = false]]
vim.cmd[[autocmd FileType go lua vim.opt.smarttab = true]]
vim.cmd[[autocmd FileType go lua vim.opt.tabstop = 4]]
vim.cmd[[autocmd FileType go lua vim.opt.shiftwidth = 4]]

vim.cmd[[autocmd FileType python lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType python lua vim.opt.tabstop = 4]]
vim.cmd[[autocmd FileType python lua vim.opt.shiftwidth = 4]]
