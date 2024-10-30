local bd = require "bufdelete"

vim.keymap.set("n", "<leader>x", function()
  bd.bufdelete(0)
end)

vim.keymap.set("n", "<leader>X", function()
  bd.bufdelete(0, true)
end)
