---@module "lazy"
---@type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  version = "*",
  opts = {
    log_level = vim.log.levels.INFO,
  },
}
