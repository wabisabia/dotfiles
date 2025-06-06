---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      sync_install = false,

      ignore_install = {},

      ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

      auto_install = false,

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
            ["<leader>pf"] = "@function.outer",
            ["<leader>pc"] = "@class.outer",
          },
        },
      },

      modules = {},
    }
  end,
}
