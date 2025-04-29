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

      format_on_save = function(bufnr)
        if vim.o.ft == "yaml" then
          return
        end
        if vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_format = "prefer",
        }
      end
    })

    vim.api.nvim_create_user_command("FormatDisable", function()
      vim.b.disable_autoformat = true
    end, {
      desc = "Disable autoformat-on-save",
      bang = false
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
      bang = false
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
