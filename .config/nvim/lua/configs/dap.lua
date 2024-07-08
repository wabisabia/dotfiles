---@type vim.fn.sign_define.dict
local bp_opts = { text = "󰼅" }

---@type vim.fn.sign_define.dict
local bpc_opts = { text = "󰼇" }

---@type vim.fn.sign_define.dict
local bpl_opts = { text = "󰭺" }

---@type vim.fn.sign_define.dict
local bps_opts = { text = "" }

vim.fn.sign_define("DapBreakpoint", bp_opts)
vim.fn.sign_define("DapBreakpointCondition", bpc_opts)
vim.fn.sign_define("DapLogPoint", bpl_opts)
vim.fn.sign_define("DapStopped", bps_opts)

local dap = require "dap"

vim.keymap.set("n", "<leader>dd", dap.toggle_breakpoint, { desc = "debug toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.clear_breakpoints, { desc = "debug clear breakpoints" })
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "debug continue" })
vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "debug step over" })
vim.keymap.set("n", "<leader>dk", dap.step_back, { desc = "debug step back" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "debug step into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "debug step out" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "debug restart" })
vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "debug pause" })
vim.keymap.set("n", "<leader>dq", dap.repl.toggle, { desc = "debug REPL" })
