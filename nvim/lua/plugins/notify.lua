---require("lazy")
---@type LazyPluginSpec
return {
  "rcarriga/nvim-notify",
  opts = {
    fps = 120,
    render = "wrapped-compact",
    stages = "no_animation",
    timeout = 5000,
    top_down = false,
  },
  init = function()
    vim.notify = require "notify"
  end,
}
