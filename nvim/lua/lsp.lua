local util = require "util"

M = {}

---@type fun(bufnr: integer)
M.config = function(bufnr)
  local fzf = require("fzf-lua")

  -- Navigation
  util.map("n", "gd", vim.lsp.buf.definition, "Go to definition", bufnr)
  util.map("n", "gD", vim.lsp.buf.declaration, "Go to declaration", bufnr)
  util.map("n", "gra", fzf.lsp_code_actions, "List code actions", bufnr)
  util.map("n", "gri", fzf.lsp_implementations, "List implementations", bufnr)
  util.map("n", "grr", function()
    fzf.lsp_references({ jump1 = true, includeDeclaration = false })
  end, "List references", bufnr)
  util.map("n", "grt", fzf.lsp_typedefs, "List type definitions", bufnr)

  util.map("n", "gO", fzf.lsp_document_symbols, "Search symbols in buffer", bufnr)
  util.map("n", "<leader>ss", fzf.lsp_live_workspace_symbols, "Search workspace symbols", bufnr)
  util.map("n", "<leader>sd", fzf.diagnostics_document, "Search document diagnostics", bufnr)
  util.map("n", "<leader>sD", fzf.diagnostics_workspace, "Search workspace diagnostics", bufnr)

  -- Rename/reword
  util.map("n", "grn", function()
    util.input(vim.lsp.buf.rename, { prompt = "New name: " })
  end, "Rename", bufnr)
  util.map("n", "grw", function()
    util.input(vim.lsp.buf.rename, { prompt = "New name: ", default = vim.fn.expand "<cword>" })
  end, "Reword", bufnr)
end

return M
