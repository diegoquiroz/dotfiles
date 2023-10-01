local lsp = require('lsp-zero')

-- lsp.preset('recommended')
-- lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap=true, silent=false }
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  lsp.default_keymaps({
    buffer = bufnr,
  })
end)

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'rust_analyzer',
    'emmet_ls',
    'tailwindcss',
    'pylsp',
    'lua_ls',
  },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- cmp settings
local cmp = require('cmp')
local cmp_format = lsp.cmp_format()
local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
--   sources = {
--     -- {name = 'copilot'},
--     {name = 'nvim_lsp'},
--   },
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    -- Supertab
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete()

  }),
})


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


-- vim.cmd[[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)]]
-- vim.cmd[[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
vim.cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.format({async=true})]]

-- Spaces size 2
vim.cmd[[autocmd FileType typescript lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType typescript lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType typescript lua vim.opt.shiftwidth = 2]]

vim.cmd[[autocmd FileType typescriptreact lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType typescriptreact lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType typescriptreact lua vim.opt.shiftwidth = 2]]

vim.cmd[[autocmd FileType javascript lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType javascript lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType javascript lua vim.opt.shiftwidth = 2]]

vim.cmd[[autocmd FileType lua lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType lua lua vim.opt.tabstop = 2]]
vim.cmd[[autocmd FileType lua lua vim.opt.shiftwidth = 2]]

-- Tab size 4
vim.cmd[[autocmd FileType go lua vim.opt.expandtab = false]]
vim.cmd[[autocmd FileType go lua vim.opt.smarttab = true]]
vim.cmd[[autocmd FileType go lua vim.opt.tabstop = 4]]
vim.cmd[[autocmd FileType go lua vim.opt.shiftwidth = 4]]

-- Spaces size 4
vim.cmd[[autocmd FileType python lua vim.opt.expandtab = true]]
vim.cmd[[autocmd FileType python lua vim.opt.tabstop = 4]]
vim.cmd[[autocmd FileType python lua vim.opt.shiftwidth = 4]]
