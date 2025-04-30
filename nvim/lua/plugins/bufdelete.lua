---@module "lazy"
---@type LazyPluginSpec
return {
  "famiu/bufdelete.nvim",
  config = function()
    local bd = require "bufdelete"
    local util = require "util"

    util.map("n", "<leader>x", function()
      bd.bufdelete(0)
    end, "Delete buffer")

    util.map("n", "<leader>X", function()
      bd.bufdelete(0, true)
    end, "Force-delete buffer")
  end,
}
