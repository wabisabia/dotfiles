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
util.map("n", "<leader>lt", "<cmd>Trouble todo toggle auto_jump=1 auto_close=1<cr>", "list todos")
util.map(
  "n",
  "<leader>ld",
  "<cmd>Trouble diagnostics toggle auto_jump=1 auto_close=1<cr>",
  "list diagnostics in buffer"
)
util.map("n", "<leader>ls", "<cmd>Trouble symbols toggle<cr>", "list symbols in buffer")

-- Util
util.map("t", "<C-x>", "<C-\\><C-n>", "escape terminal mode")

-- Ascend
util.map("n", "gz", function()
  vim.cmd("ZenMode")
end, "ascend")
