---@module "lazy"
---@type LazyPluginSpec
return {
  "folke/lazydev.nvim",
  version = "*",
  ft = "lua",
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
  },
}
