local map = vim.keymap.set
local util = require "util"

-- Search
util.map("n", "/", "/\\v", "search regex")

-- Move
util.map("n", "<C-h>", "<C-w>h", "move left one window")
util.map("n", "<C-j>", "<C-w>j", "move up one window")
util.map("n", "<C-k>", "<C-w>k", "move down one window")
util.map("n", "<C-l>", "<C-w>l", "move right one window")

-- Goto
util.map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", "goto next buffer")
util.map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", "goto prev buffer")

-- Show
util.map("n", "L", vim.diagnostic.open_float, "show diagnostics at cursor")
util.map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", "show file explorer")

-- List
map("n", "<leader>tt", "<cmd>Trouble todo toggle filter.buf=0<cr>", { desc = "list todos in buffer" })
map("n", "<leader>tT", "<cmd>Trouble todo toggle<cr>", { desc = "list todos in workspace" })
map(
  "n",
  "<leader>td",
  "<cmd>Trouble diagnostics toggle filter.buf=0 auto_close=1<cr>",
  { desc = "list diagnostics in buffer" }
)
map("n", "<leader>tD", "<cmd>Trouble diagnostics toggle auto_close=1<cr>", { desc = "list diagnostics in workspace" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle<cr>", { desc = "list symbols in buffer" })

-- Util
util.map("t", "<C-x>", "<C-\\><C-n>", "escape terminal mode")

-- Ascend
local zen = require "zen-mode"
local twilight = require "twilight"

util.map("n", "gz", function()
  zen.open()
  twilight.enable()
end, "ascend")

util.map("n", "gZ", function()
  zen.close()
  twilight.disable()
end, "descend")
