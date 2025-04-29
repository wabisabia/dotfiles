local util = require "util"

M = {}

---@type fun(bufnr: integer)
M.config = function(bufnr)
  local fzf = require("fzf-lua")

  -- Navigation
  util.map("n", "gd", vim.lsp.buf.definition, "Go to definition", bufnr)
  util.map("n", "gD", vim.lsp.buf.declaration, "Go to declaration", bufnr)
  util.map("n", "gi", vim.lsp.buf.implementation, "Go to implementation", bufnr)
  util.map("n", "gr", fzf.lsp_references, "Go to references", bufnr)
  util.map("n", "<leader>s", fzf.lsp_live_workspace_symbols, "Go to symbol", bufnr)
  util.map("n", "ge", fzf.diagnostics_document, "Go to document diagnostic", bufnr)
  util.map("n", "g<c-e>", fzf.diagnostics_workspace, "Go to workspace diagnostic", bufnr)

  -- Rename/reword
  util.map("n", "<leader>rn", function()
    util.input(vim.lsp.buf.rename, { prompt = "New name: " })
  end, "Rename", bufnr)
  util.map("n", "<leader>rw", function()
    util.input(vim.lsp.buf.rename, { prompt = "New name: ", default = vim.fn.expand "<cword>" })
  end, "Reword", bufnr)

  util.map({ "n", "v" }, "<leader>a", fzf.lsp_code_actions, "List code actions", bufnr)
end

return M
