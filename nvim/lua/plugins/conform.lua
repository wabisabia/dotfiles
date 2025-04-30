---@module "lazy"
---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  version = "*",
  config = function()
    local conform = require "conform"
    local util = require "util"

    conform.setup({
      formatters_by_ft = {
        json = { "jsonformat" },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
      },

      ---@module "conform"
      ---@type table<string, conform.FormatterConfigOverride>
      formatters = {
        jsonformat = {
          command = "jsonformat",
        },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "prefer",
      },
    })

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
