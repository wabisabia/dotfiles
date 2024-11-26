---require("lazy")
---@type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  opts = {
    log_level = vim.log.levels.INFO,
  },
}
