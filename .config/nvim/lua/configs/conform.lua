local conform = require "conform"

conform.setup(require "opts.conform")

vim.keymap.set("n", "<leader>fm", function()
  conform.format(nil, function(err, did_edit)
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
end, { desc = "Format buffer" })
