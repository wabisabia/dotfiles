---require("lazy")
---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json = { "jsonformat" },
      sh = { "shfmt" },
      yaml = { "yamlfmt" },
    },

    ---require("conform")
    ---@type table<string, conform.FormatterConfigOverride>
    formatters = {
      jsonformat = {
        command = "jsonformat",
      },
    },

    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
  config = function()
    local conform = require "conform"
    local util = require "util"

    util.map("n", "<leader>af", function()
      conform.format({ lsp_format = "prefer" }, function(err, did_edit)
        local msg
        local level
        if err == nil then
          msg = did_edit and "Buffer formatted" or "Buffer already formatted"
          level = vim.log.levels.INFO
        else
          msg = err
          level = vim.log.levels.ERROR
        end
        vim.notify(msg, level)
      end)
    end, "format buffer")
  end,
}