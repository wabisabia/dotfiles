local util = require "util"

util.map("n", "<leader>r", function()
  util.run_in_split("python " .. vim.fn.expand "%")
end, "run current file")

util.map("n", "<leader>c", function()
  util.run_in_split { "ruff", "check" }
end, "lint project")

util.map("n", "<leader>C", function()
  util.run_in_split { "ruff", "check", "--fix" }
  vim.cmd ":e"
end, "fix autofixable lints")
