---require("lazy")
---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      files = {
        git_icons = true,
        hidden = false,
      },
      lsp = {
        symbols = {
          symbol_style = 2,
          symbol_fmt = function(s) return s end,
        },
      },
    })
    local util = require("util")
    util.map("n", "<leader>f", function() fzf.files({ git_icons = true }) end, "search files")
    util.map("n", "<leader>F", function() fzf.files({ hidden = true }) end, "search files (include hidden)")
    util.map("n", "<leader>w", fzf.live_grep, "search file contents")
    util.map("n", "<leader>o", fzf.buffers, "search buffers")
    util.map("n", "<leader>h", fzf.helptags, "search helptags")
  end
}
