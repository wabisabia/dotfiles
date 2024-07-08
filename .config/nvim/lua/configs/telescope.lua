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

vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "search normal mode keymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "search files in workspace" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "search git files in workspace" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "search in workspace" })
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "search in buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "search help tags" })
vim.keymap.set("n", "<leader>fs", builtin.spell_suggest, { desc = "search spelling" })
vim.keymap.set("n", "<leader>ft", builtin.lsp_workspace_symbols, { desc = "search workspace symbols" })
vim.keymap.set("n", "<leader>fe", builtin.builtin, { desc = "search builtins" })
