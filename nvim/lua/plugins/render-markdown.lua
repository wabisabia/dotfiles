---@module "lazy"
---@type LazyPluginSpec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-mini/mini.icons'
  },
  ft = "markdown",
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    latex = {
      enabled = false,
    },
  },
}
