-- Auto Pairs
local npairs = require('nvim-autopairs')
npairs.setup({
  check_ts = true,
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp = require('cmp')

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

    end,
  },
  mapping = {

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"]() == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    -- For vsnip user.
    { name = 'vsnip' },
    { name = 'buffer' },
  }
}




-- local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local check_back_space = function()
--     local col = vim.fn.col(".") - 1
--     if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
--         return true
--     else
--         return false
--     end
-- end


-- local function replace_keycodes(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- function _G.tab_binding()
--   if vim.fn.pumvisible() ~= 0 then
--     return replace_keycodes("<C-n>")
--   elseif vim.fn["vsnip#available"](1) ~= 0 then
--     return replace_keycodes("<Plug>(vsnip-expand-or-jump)")
--   else
--     return replace_keycodes("<Plug>(Tabout)")
--   end
-- end

-- function _G.s_tab_binding()
--   if vim.fn.pumvisible() ~= 0 then
--     return replace_keycodes("<C-p>")
--   elseif vim.fn["vsnip#jumpable"](-1) ~= 0 then
--     return replace_keycodes("<Plug>(vsnip-jump-prev)")
--   else
--     return replace_keycodes("<Plug>(TaboutBack)")
--   end
-- end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", {expr = true})
