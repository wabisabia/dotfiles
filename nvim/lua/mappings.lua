require "nvchad.mappings"

local map = vim.keymap.set

map("n", "/", "/\\v", { desc = "search regex" })

local nomap = vim.keymap.del

nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("n", "<C-s>")
nomap("n", "<C-c>")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")
