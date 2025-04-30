---@module "lazy"
---@type LazyPluginSpec
return {
  "L3MON4D3/LuaSnip",
  version = "*",
  build = "make install_jsregexp",
  dependencies = "rafamadriz/friendly-snippets",
  ft = "lua",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
