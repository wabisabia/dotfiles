---@module "lazy"
---@type LazyPluginSpec
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    local util = require("util")
    util.map("n", "<C-n>", oil.toggle_float, "Toggle Oil floating window")
    oil.setup()
  end,
  lazy = false,
}
