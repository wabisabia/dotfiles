---@module "lazy"
---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap",
  version = "*",
  config = function()
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
    local util = require "util"

    util.map("n", "<leader>dd", dap.toggle_breakpoint, "debug toggle breakpoint")
    util.map("n", "<leader>dc", dap.clear_breakpoints, "debug clear breakpoints")
    util.map("n", "<leader>d?", function()
      util.input(dap.toggle_breakpoint)
    end, "debug clear breakpoints")
    util.map("n", "<leader>ds", dap.continue, "debug continue")
    util.map("n", "<leader>dj", dap.step_over, "debug step over")
    util.map("n", "<leader>dk", dap.step_back, "debug step back")
    util.map("n", "<leader>di", dap.step_into, "debug step into")
    util.map("n", "<leader>do", dap.step_out, "debug step out")
    util.map("n", "<leader>dr", dap.restart, "debug restart")
    util.map("n", "<leader>dp", dap.pause, "debug pause")
    util.map("n", "<leader>dq", dap.repl.toggle, "debug REPL")
  end,
}
