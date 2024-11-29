local bufnr = vim.api.nvim_get_current_buf()
local util = require "util"
local lsp = require "lsp"

vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
lsp.set_common_lsp_keymaps(bufnr)

-- override keymaps

util.map("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, "open hover float", bufnr)

util.map("n", "L", function()
  vim.cmd.RustLsp { "renderDiagnostic", "current" }
end, "open diagnostic float", bufnr)

util.map("n", "<leader>la", function()
  vim.cmd.RustLsp "codeAction"
end, "list code actions", bufnr)

-- rust keymaps

util.map("n", ">i", function()
  vim.cmd.RustLsp { "moveItem", "down" }
end, "move item down", bufnr)

util.map("n", "<i", function()
  vim.cmd.RustLsp { "moveItem", "up" }
end, "move item up", bufnr)

-- cargo keymaps

util.map("n", "<leader>r", "<cmd>Cargo run<cr>", "run primary binary")
util.map("n", "<leader>c", "<cmd>Cargo check<cr>", "check project")
util.map("n", "<leader>al", "<cmd>Cargo clippy -- -D clippy::pedantic<cr>", "lint with clippy")
util.map("n", "<leader>b", "<cmd>Cargo build<cr>", "build project")
util.map("n", "<leader>ad", "<cmd>Cargo doc<cr>", "build docs")
util.map("n", "<leader>a<C-d>", "<cmd>Cargo doc --open<cr>", "build and open docs")
util.map("n", "<leader>ap", function()
  util.input(function(dep)
    vim.cmd.Cargo("add " .. dep)
  end, { prompt = "Add dependency: " })
end, "add crate(s)")
util.map("n", "<leader>a<C-p>", function()
  util.input(function(dep)
    vim.cmd.Cargo("remove " .. dep)
  end, { prompt = "Remove dependency: " })
end, "remove crate(s)")
