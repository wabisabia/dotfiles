require "nvchad.mappings"

local nomap = vim.keymap.del

nomap("i", "<C-h>")
nomap("i", "<C-l>")

nomap("n", "<C-s>")
nomap("n", "<C-c>")

nomap("n", "<Tab>")
nomap("n", "<S-Tab>")

nomap("n", "<leader>rn")
nomap("n", "<leader>n")

local map = vim.keymap.set

map("n", "<C-t>n", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<C-t>p", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "/", "/\\v", { desc = "search regex" })

map("n", "L", vim.diagnostic.open_float, { desc = "diagnostics show in floating window" })
