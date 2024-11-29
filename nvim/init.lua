-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

local opt = vim.opt
local g = vim.g

opt.rtp:prepend(lazypath)

g.mapleader = " "
g.maplocalleader = "\\"

-- Important

opt.smartcase = true
opt.ignorecase = true

opt.relativenumber = true
opt.number = true

opt.inccommand = "split"

opt.termguicolors = true

-- Opinion

opt.wrap = false

opt.colorcolumn = "120"

opt.scrolloff = 15

opt.splitbelow = true
opt.splitright = true

opt.laststatus = 3

opt.cursorline = true
opt.cursorlineopt = "screenline,number"

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.undofile = true

opt.timeoutlen = 400

opt.more = false

---@type LazyConfig
local lazy_cfg = {
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "kanagawa-dragon" } },
  ui = {
    border = "rounded"
  }
}

require("lazy").setup(lazy_cfg)

vim.cmd.colorscheme("kanagawa-dragon")

vim.schedule(function()
  require "mappings"
end)
