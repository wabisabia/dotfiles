---require("lazy")
---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,   -- This plugin is already lazy
  config = function()
    require("neotest").setup {
      adapters = {
        require "rustaceanvim.neotest",
      },
    }
  end,
}
