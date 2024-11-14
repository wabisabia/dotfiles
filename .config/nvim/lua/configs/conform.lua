local conform = require "conform"
local util = require "util"

conform.setup(require "opts.conform")

util.map("n", "<leader>af", function()
  conform.format({ lsp_format = "first" }, function(err, did_edit)
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
