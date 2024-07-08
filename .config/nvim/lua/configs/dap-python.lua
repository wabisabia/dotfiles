local dap_python = require "dap-python"

dap_python.setup ".venv/bin/python"
dap_python.test_runner = "pytest"

vim.keymap.set("n", "<leader>dt", dap_python.test_method, { desc = "debug test method" })
