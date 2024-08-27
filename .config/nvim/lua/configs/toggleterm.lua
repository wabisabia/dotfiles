local tt = require "toggleterm"

vim.keymap.set("t", "<C-t>", tt.toggle_all)

tt.setup {
  open_mapping = [[<c-t>]],
}
