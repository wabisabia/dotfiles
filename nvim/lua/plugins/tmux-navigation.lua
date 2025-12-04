---@module "lazy"
---@type LazyPluginSpec
return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local nav = require("nvim-tmux-navigation")

    nav.setup {
      disable_when_zoomed = true,
    }

    vim.keymap.set("n", "<C-h>", nav.NvimTmuxNavigateLeft)
    vim.keymap.set("n", "<C-j>", nav.NvimTmuxNavigateDown)
    vim.keymap.set("n", "<C-k>", nav.NvimTmuxNavigateUp)
    vim.keymap.set("n", "<C-l>", nav.NvimTmuxNavigateRight)
  end,

}
