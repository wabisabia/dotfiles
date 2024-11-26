---require("lazy")
---@type LazyPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    filters = {
      enable = false,
    },
    sort = {
      sorter = "extension",
    },
  },
}
