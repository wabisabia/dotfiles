---@module "lazy"
---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  lazy = false,
  config = function()
    require("neotest").setup {
      adapters = {
        require "rustaceanvim.neotest",
      },
    }
  end,
}
