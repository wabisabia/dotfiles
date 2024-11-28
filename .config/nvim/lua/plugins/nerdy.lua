---require("lazy")
---@type LazyPluginSpec
return {
  '2kabhishek/nerdy.nvim',
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("nerdy")

    require("util").map("n", "fn", telescope.extensions.nerdy.nerdy, "search nerdicons")
  end
}
