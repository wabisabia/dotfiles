---@module "lazy"
---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  version = "*",
  opts = {
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
