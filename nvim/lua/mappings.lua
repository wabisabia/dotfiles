local util = require "util"

-- Search
util.map("n", "/", "/\\v", "search regex")

-- Terminal split
util.map("n", "<leader>vt", ":vert term<cr>i", "Open terminal in vertical split")
