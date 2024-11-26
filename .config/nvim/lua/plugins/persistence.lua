---require("lazy")
---@type LazyPluginSpec
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  config = function()
    local persistence = require "persistence"
    local util = require "util"

    persistence.setup()

    util.map("n", "<leader>sr", persistence.load, "restore previous session")
  end,
}
