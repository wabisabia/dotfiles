---require("lazy")
---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  opts = {
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
  dependencies = "nvim-lua/plenary.nvim",
}
