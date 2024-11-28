local util = require "util"

util.map("n", "<leader>ar", function()
  util.run_in_split(vim.fn.expandcmd "./%")
end, "run current script")

util.map("n", "<leader>at", function()
  util.run_in_split(vim.fn.expandcmd "time ./%")
end, "time current script")
