---@module "lazy"
---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  ft = { "rust", "toml" },
  config = function()
    require("neotest").setup {
      adapters = {
        require "rustaceanvim.neotest",
      },
    }
  end,
}
