---@module "lazy"
---@type LazyPluginSpec
return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup {}
  end,
}
