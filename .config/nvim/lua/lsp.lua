local lsp = require('lspconfig')

lsp.intelephense.setup{}
-- For python autocompletion
lsp.pylsp.setup{
settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        flake8 = { enabled = true }
      }
    }
  }}
lsp.efm.setup{
  on_attach = on_attach,
  init_options = {
	documentFormatting = true,
    codeAction = true,
  },
  filetypes = { 
	  --"python",
--	  --"typescript" 
  },
  settings = {
    languages = {
      -- For python linting and formatting
      python = {
        {
          --lintCommand = "pylint ${INPUT} --msg-template='{path}:{line}:{column}: {msg_id}: {msg}'",
          --lintStdin = true,
          --lintIgnoreExitCode = true,
          --lintFormats = {"%f:%l:%c: %m"},
          --lintSource = "pylint",

          --formatCommand = "black -S -l 79 -",
          --formatStdin = true
        }
      },
	  --typescript = {
	  --  {
    --    lintCommand = "deno lint -",
    --    lintStdin = true,
    --    lintIgnoreExitCode = true,
    --    lintFormats = {"%f:%l:%c: %m"},
    --    lintSource = "deno",
	  --    formatCommand = "deno fmt -",
	  --    formatStdin = true,
	  --  }
	  --	
	  --}
    }
  }
}

lsp.denols.setup{
  init_options = {
    enable = true,
    lint = true,
	format = false,
    unstable = true
  }
}

-- Golang
lsp.gopls.setup{}

-- JSON
lsp.jsonls.setup{}

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

lsp.emmet_ls.setup{
  capabilities = capabilities;
}

lsp.vuels.setup{}

-- TODO: organize this code
--[[
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

lsp.html.setup{
  capabilities = capabilities,
}
--]]

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
--[[
vim.fn.sign_define("LspDiagnosticsSignError", {text = "‼️", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚠️", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "❔", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", numhl = "LspDiagnosticsDefaultHint"})
--]]


vim.cmd[[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()]]
vim.cmd[[autocmd FileType typescript lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType typescript lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType typescript lua vim.opt.shiftwidth = 2]]
vim.cmd[[autocmd FileType go lua vim.opt.expandtab = false]]
vim.cmd[[autocmd FileType go lua vim.opt.smarttab = true]]
vim.cmd[[autocmd FileType go lua vim.opt.tabstop = 4]]
vim.cmd[[autocmd FileType go lua vim.opt.shiftwidth = 4]]
vim.cmd[[autocmd FileType python lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType python lua vim.opt.tabstop = 4]]
vim.cmd[[autocmd FileType python lua vim.opt.shiftwidth = 4]]
