local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=false }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lsp.emmet_ls then
  require('lspconfig/configs').emmet_ls = {
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css'};
      root_dir = function(fname)
        return vim.loop.cwd();  
      end;
      settings = {};
    };
  }
end


lsp.vuels.setup{
  on_attach = on_attach,
}

-- TODO: organize this code


vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


vim.cmd[[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()]]

vim.cmd[[autocmd FileType typescript lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType typescript lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType typescript lua vim.opt.shiftwidth = 2]]

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
