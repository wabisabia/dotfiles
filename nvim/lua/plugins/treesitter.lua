---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
}
