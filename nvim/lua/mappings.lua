local map = vim.keymap.set

local telescope = require "telescope.builtin"

-- Close
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "close buffer" })
map("n", "<leader>X", "<cmd>bd!<cr>", { desc = "close buffer (forcibly)" })

-- Search
map("n", "<leader>fk", telescope.keymaps, { desc = "search normal mode keymaps" })
map("n", "<leader>ff", telescope.git_files, { desc = "search files in workspace (respects `.gitignore`)" })
map("n", "<leader>fg", telescope.find_files, { desc = "search files in workspace" })
map("n", "<leader>fw", telescope.live_grep, { desc = "search in workspace" })
map("n", "<leader>fz", telescope.current_buffer_fuzzy_find, { desc = "search in buffer" })
map("n", "<leader>fh", telescope.help_tags, { desc = "search help tags" })
map("n", "<leader>fs", telescope.spell_suggest, { desc = "search spelling" })
map("n", "<leader>ft", telescope.builtin, { desc = "search builtins" })
map("n", "/", "/\\v", { desc = "search regex" })
map("n", "<leader>fc", "<cmd>Cheatsheet<cr>", { desc = "search cheatsheet" })

-- Move
map("n", "<C-h>", "<C-w>h", { desc = "move left one window" })
map("n", "<C-j>", "<C-w>j", { desc = "move up one window" })
map("n", "<C-k>", "<C-w>k", { desc = "move down one window" })
map("n", "<C-l>", "<C-w>l", { desc = "move right one window" })

-- Goto
map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", { desc = "goto next buffer" })
map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", { desc = "goto prev buffer" })

-- Show
map("n", "L", vim.diagnostic.open_float, { desc = "show diagnostics at cursor" })
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "show file explorer" })

-- List
map("n", "<leader>tt", "<cmd>Trouble todo toggle filter.buf=0<cr>", { desc = "list todos in buffer" })
map("n", "<leader>tT", "<cmd>Trouble todo toggle<cr>", { desc = "list todos in workspace" })
map("n", "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "list diagnostics in buffer" })
map("n", "<leader>tD", "<cmd>Trouble diagnostics toggle<cr>", { desc = "list diagnostics in workspace" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle<cr>", { desc = "list symbols in buffer" })

-- Util
map("t", "<C-x>", "<C-\\><C-n>", { desc = "escape terminal mode" })

-- Ascend
local zen = require "zen-mode"
local twilight = require "twilight"

map("n", "gz", function()
  zen.open()
  twilight.enable()
end, { desc = "ascend" })

map("n", "gZ", function()
  zen.close()
  twilight.disable()
end, { desc = "descend" })
