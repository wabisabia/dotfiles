---@module "lazy"
---@type LazyPluginSpec
return {
  "nvim-neotest/neotest",
  version = "*",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local neotest = require "neotest"
    local util = require "util"

    util.map("n", "t*", function()
      neotest.summary.open()
      neotest.run.run(vim.fn.getcwd())
    end, "Run all tests in project")

    util.map("n", "tt", function()
      neotest.run.run()
    end, "Run nearest test")

    util.map("n", "tf", function()
      neotest.run.run(vim.fn.expand "%")
    end, "Run all tests in file")

    util.map("n", "td", function()
      neotest.run.run { strategy = "dap" }
    end, "Debug nearest test")

    util.map("n", "to", function()
      neotest.output.open { enter = true }
    end, "Open nearest test output")

    util.map("n", "ts", function()
      neotest.summary.toggle()
    end, "Toggle test summary")
  end,
}
