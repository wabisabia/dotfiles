local persistence = require "persistence"
local util = require "util"

persistence.setup()

util.map("n", "<leader>sr", persistence.load, "restore previous session")