---require("lazy")
---@type LazyPluginSpec
return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    commented = true,
    virt_text_pos = "eol",
  },
}
