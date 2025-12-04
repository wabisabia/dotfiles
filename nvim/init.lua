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
table.insert(opt.completeopt, "fuzzy")

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
opt.swapfile = false

opt.timeoutlen = 400

opt.more = false

-- Diagnostics

---@type vim.diagnostic.Opts
local diagnostics = {
  severity_sort = true,
  update_in_insert = true,
  float = {
    source = true,
  },
  underline = false,
  virtual_text = true,
  signs = {
    -- text = {
    --   [vim.diagnostic.severity.ERROR] = "󰅚",
    --   [vim.diagnostic.severity.WARN]  = "󰀪",
    --   [vim.diagnostic.severity.HINT]  = "󰌶",
    --   [vim.diagnostic.severity.INFO]  = "",
    -- },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.HINT] = "HintMsg",
      [vim.diagnostic.severity.INFO] = "InfoMsg",
    },
  },
}

vim.diagnostic.config(diagnostics)

-- File types

vim.filetype.add({
  extension = {
    tf = "terraform"
  },
  pattern = {
    [".*/%.github/workflows/.*%.ya?ml"] = "yaml.ghactions",
    ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
  }
})

local servers = {
  "basedpyright",
  "bashls",
  "docker_language_server",
  "dockerls",
  "gh_actions_ls",
  "jsonls",
  "lua_ls",
  "marksman",
  "postgres_lsp",
  "ruff",
  "terraformls",
  "tombi",
  "typos_lsp",
  "yamlls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

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
