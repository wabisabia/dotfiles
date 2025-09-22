---@module "lazy"
---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      lsp = {
        symbols = {
          symbol_style = 2,
          symbol_fmt = function(s) return s end,
        },
      },
    })

    fzf.register_ui_select()

    local util = require("util")

    util.map("n", "<leader>f", fzf.global, "search files")
    util.map("n", "<leader>F", fzf.files, "search files (include hidden)")
    util.map("n", "<leader>w", fzf.live_grep_glob, "search file contents (with globbing)")
    util.map("n", "<leader>o", fzf.buffers, "search buffers")

    util.map("n", "<leader>fk", fzf.keymaps, "search keymaps")
    util.map("n", "<leader>fh", fzf.helptags, "search helptags")
    util.map("n", "<leader>fm", fzf.spellcheck, "search misspelled in buffer")
    util.map("n", "<leader>fs", fzf.spell_suggest, "search spelling suggestions")
    util.map("n", "<leader>fb", fzf.builtin, "search builtins")
  end
}
