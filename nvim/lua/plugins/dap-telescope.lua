---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-telescope/telescope-dap.nvim",
  dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter" },
  config = function()
    local ts_dap = require("telescope").extensions.dap
    local util = require "util"

    vim.api.nvim_create_autocmd("TermEnter", {
      callback = function()
        util.map("n", "<leader>fv", ts_dap.variables, "search variables (while debugging)")
      end,
    })

    vim.api.nvim_create_autocmd("TermLeave", {
      callback = function()
        vim.keymap.del("n", "<leader>fv")
      end,
    })

    -- local function set_keymaps()
    --   -- util.map("n", "<leader>fv", ts_dap.variables, "search variables (while debugging)")
    -- end
    --
    -- local function del_keymaps()
    --   -- vim.keymap.del("n", "<leader>fv")
    -- end
    --
    -- local dap = require "dap"
    --
    -- dap.listeners.before.attach.setup_telescope_dap = set_keymaps
    -- dap.listeners.before.launch.setup_telescope_dap = set_keymaps
    --
    -- dap.listeners.before.event_terminated.teardown_telescope_dap = del_keymaps
    -- dap.listeners.before.event_exited.teardown_telescope_dap = del_keymaps
  end,
}
