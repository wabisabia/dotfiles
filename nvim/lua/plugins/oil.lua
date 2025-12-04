---@module "lazy"
---@type LazyPluginSpec
return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  config = function()
    local oil = require("oil")
    local util = require("util")
    util.map("n", "<C-n>", oil.toggle_float, "Toggle Oil floating window")
    ---@module 'oil'
    ---@type oil.SetupOpts
    oil.setup({
      columns = {
        "icon",
        "size",
      },
    })
  end,
  lazy = false,
}
