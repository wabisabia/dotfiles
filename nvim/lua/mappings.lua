local util = require "util"

-- Search
util.map("n", "/", "/\\v", "search regex")

-- Show
util.map("n", "L", vim.diagnostic.open_float, "show diagnostics at cursor")

-- Util
util.map("t", "<C-x>", "<C-\\><C-n>", "escape terminal mode")
