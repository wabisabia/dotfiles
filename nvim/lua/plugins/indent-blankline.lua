---require("lazy")
---@type LazyPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  version = "*",
  opts = {
    scope = {
      enabled = false,
    },
  },
}
