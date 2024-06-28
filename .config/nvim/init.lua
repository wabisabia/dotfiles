vim.cmd [[colorscheme retrobox]]

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  spec = { import = "plugins" },
  install = { colorscheme = { "gruvbox" } },
}, lazy_config)

vim.schedule(function()
  require "mappings"
end)

require "options"

local open_with_trouble = require("trouble.sources.telescope").open
require("telescope").setup {
  defaults = {
    mappings = {
      n = { ["<leader>t"] = open_with_trouble },
    },
  },
}
