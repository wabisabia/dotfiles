--- @module "lazy"
--- @type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  lazy = false,
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  ---@diagnostic enable: missing-fields
  config = function()
    local fzf = require("fzf-lua")
    ---@type fzf-lua.Config|{}
    fzf.setup({
      defaults = {
        file_icons = "mini",
      },
      lsp = {
        symbols = {
          symbol_style = 2,
          symbol_fmt = function(s) return s end,
        },
      },
    })

    fzf.register_ui_select()

    local util = require("util")

    util.map("n", "<leader><space>", fzf.files, "search files (include hidden)")
    util.map({ "v", "x" }, "<leader>w", fzf.grep_visual,
      "search file contents from visual selection (use `--` to trigger globbing)")
    util.map("n", "<leader>,", fzf.buffers, "search buffers")
    util.map("n", "<leader>.", fzf.blines, "search current buffer")
    util.map("n", "<leader>/", fzf.live_grep, "search file contents (use `--` to trigger globbing)")

    util.map("n", "<leader>fm", fzf.spellcheck, "find misspelled in buffer")

    util.map("n", "<leader>sb", fzf.builtin, "search builtins")
    util.map("n", "<leader>sg", fzf.spell_suggest, "search spelling suggestions")
    util.map("n", "<leader>sh", fzf.helptags, "search helptags")
    util.map("n", "<leader>sk", fzf.keymaps, "search keymaps")
  end
}
