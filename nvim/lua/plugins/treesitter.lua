---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    })
}
