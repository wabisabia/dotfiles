local options = {
  ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "textobj a function" },
        ["if"] = { query = "@function.inner", desc = "textobj in function" },
        ["ac"] = { query = "@class.outer", desc = "textobj a class" },
        ["ic"] = { query = "@class.inner", desc = "textobj in class" },
        ["a,"] = { query = "@parameter.outer", desc = "textobj a parameter" },
        ["i,"] = { query = "@parameter.inner", desc = "textobj in parameter" },
        ["a?"] = { query = "@conditional.outer", desc = "textobj a conditional" },
        ["i?"] = { query = "@conditional.inner", desc = "textobj in conditional" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [">,"] = "@parameter.inner",
      },
      swap_previous = {
        ["<,"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = "none",
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

return options
