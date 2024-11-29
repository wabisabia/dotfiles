---require "lazy"
---@type LazyPluginSpec
return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local nav = require("nvim-tmux-navigation")

    nav.setup {
      disable_when_zoomed = true,
    }

    vim.keymap.set("n", "<C-h>", nav.NvimTmuxNavigateLeft)
    vim.keymap.set("n", "<C-j>", nav.NvimTmuxNavigateDown)
    vim.keymap.set("n", "<C-k>", nav.NvimTmuxNavigateUp)
    vim.keymap.set("n", "<C-l>", nav.NvimTmuxNavigateRight)

    local function tmux_command(command)
      local tmux_socket = vim.fn.split(vim.env.TMUX, ",")[1]
      return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
    end

    local nvim_tmux_nav_group = vim.api.nvim_create_augroup("NvimTmuxNavigation", {})

    vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
      group = nvim_tmux_nav_group,
      callback = function()
        tmux_command("set-option -p @is_vim yes")
      end,
    })

    vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
      group = nvim_tmux_nav_group,
      callback = function()
        tmux_command("set-option -p -u @is_vim")
      end,
    })
  end,

}
