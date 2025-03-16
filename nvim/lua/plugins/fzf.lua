---require("lazy")
---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require("fzf-lua")
    local util = require("util")
    util.map("n", "<leader>f", fzf.files, "search files")
    util.map("n", "<leader>w", fzf.live_grep, "search file contents")
    util.map("n", "<leader>b", fzf.buffers, "search buffers")
  end
}
