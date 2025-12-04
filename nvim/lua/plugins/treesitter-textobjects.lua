---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  config = function()
    local to = require("nvim-treesitter-textobjects")

    to.setup {
      select = {
        enable = true,
        lookahead = true,
        selection_modes = {
          ['@function.outer'] = 'V',
          ['@class.outer'] = 'V',
        }
      },
      swap = {
        enable = true,
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
    }

    local select = require("nvim-treesitter-textobjects.select")

    vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "a,", function() select.select_textobject("@parameter.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "i,", function() select.select_textobject("@parameter.inner", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "a?", function() select.select_textobject("@conditional.outer", "textobjects") end)
    vim.keymap.set({ "x", "o" }, "i?", function() select.select_textobject("@conditional.inner", "textobjects") end)

    local swap = require("nvim-treesitter-textobjects.swap")

    vim.keymap.set("n", ">,", function() swap.swap_next("@parameter.inner", "textobjects") end)
    vim.keymap.set("n", "<,", function() swap.swap_previous("@parameter.inner", "textobjects") end)
  end
}
