require("neotest").setup {
  adapters = {
    require "neotest-python" {
      args = { "--log-level", "INFO", "-vv" },
    },
  },
}
