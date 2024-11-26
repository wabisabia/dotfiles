---require("lazy")
---@type LazyPluginSpec
return {
  "nvim-neotest/neotest-python",
  dependencies = {
    "nvim-neotest/neotest",
  },
  ft = "python",
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python" {
          args = { "--log-level", "INFO", "-vv" },
        },
      },
    }
  end,
}
