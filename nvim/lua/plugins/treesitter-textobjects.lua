---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    -- vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    local to = require("nvim-treesitter-textobjects")

    to.setup {
      select = {
        enable = true,
        lookahead = true,
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
