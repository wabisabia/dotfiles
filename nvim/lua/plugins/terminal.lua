---@module "lazy"
---@type LazyPluginSpec
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local tt = require "toggleterm"
    local util = require "util"

    util.map("t", "<C-t>", tt.toggle_all, "Toggle terminal")

    tt.setup {
      open_mapping = [[<c-t>]],
    }
  end,
}
