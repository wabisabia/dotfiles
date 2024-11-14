local telescope = require "telescope"

telescope.load_extension "fzf"
telescope.load_extension "dap"

local open_with_trouble = require("trouble.sources.telescope").add
telescope.setup {
  defaults = {
    mappings = {
      n = { ["<C-t>"] = open_with_trouble },
    },
  },
}

local builtin = require "telescope.builtin"
local util = require "util"

util.map("n", "<leader>fk", builtin.keymaps, "search normal mode keymaps")
util.map("n", "<leader>ff", builtin.find_files, "search files in workspace")
util.map("n", "<leader>fg", builtin.git_files, "search git files in workspace")
util.map("n", "<leader>fw", builtin.live_grep, "search in workspace")
util.map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, "search in buffer")
util.map("n", "<leader>fh", builtin.help_tags, "search help tags")
util.map("n", "<leader>fs", builtin.spell_suggest, "search spelling")
util.map("n", "<leader>ft", builtin.lsp_workspace_symbols, "search workspace symbols")
util.map("n", "<leader>fe", builtin.builtin, "search builtins")
