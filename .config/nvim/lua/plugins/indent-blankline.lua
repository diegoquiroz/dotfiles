--
-- Indent lines
--
return {
  'lukas-reineke/indent-blankline.nvim',
  event = "BufReadPre",
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    -- vim.opt.listchars:append("eol:↴")

    require('indent_blankline').setup{
      use_treesitter = true,
      space_char_blankline = " ",
      show_end_of_line = true,
     
      strict_tabs = true,
      show_current_context = true,
      context_patterns = {
        "class",
        "function",
        "method",
        "^if",
        "while",
        "for",
        "with",
        "func_literal",
        "block",
        "try",
        "except",
        "argument_list",
        "object",
        "dictionary"
      },
      filetype_exclude = {"help", "terminal", "fzf", "floaterm", "alpha", "packer", "floatline"},
      buftype_exclude = {"terminal", "nofile"},
      
      --show_trailing_blankline_indent = false,
     
    }

  end
}
