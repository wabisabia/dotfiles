---require("lazy")
---@type LazyPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-tree").setup {
      filters = {
        enable = false,
      },
      sort = {
        sorter = "extension",
      },
    }
    local util = require "util"
    util.map("n", "<C-n>", vim.cmd.NvimTreeFindFileToggle, "toggle file explorer at current file")
    util.map("n", "<C-S-n>", vim.cmd.NvimTreeToggle, "toggle file explorer")
  end
}
