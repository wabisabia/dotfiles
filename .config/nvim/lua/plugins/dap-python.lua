---require("lazy")
---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap-python",
  dependencies = "mfussenegger/nvim-dap",
  ft = "python",
  config = function()
    local dap_python = require "dap-python"

    dap_python.setup(vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python")
    dap_python.test_runner = "pytest"
  end,
}
