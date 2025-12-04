---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  ---@module "nvim-treesitter-context"
  ---@type TSContext.Config
  opts = {
    max_lines = math.max(7, vim.o.scrolloff - 5),
  },
}
