---@module "lazy"
---@type LazyPluginSpec
return {
  "julienvincent/hunk.nvim",
  cmd = {
    "HunkDiffView",
    "HunkDiffEditor",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-mini/mini.icons",
  }
}
