local util = require "util"

M = {}

---@type fun(bufnr: integer)
M.config = function(bufnr)
  local fzf = require("fzf-lua")

  -- Navigation
  util.map("n", "gd", vim.lsp.buf.definition, "Go to definition", bufnr)
  util.map("n", "gD", vim.lsp.buf.declaration, "Go to declaration", bufnr)
  util.map("n", "grr", fzf.lsp_references, "List references", bufnr)
  util.map("n", "<leader>s", fzf.lsp_document_symbols, "Go to symbol in buffer", bufnr)
  util.map("n", "<leader>S", fzf.lsp_live_workspace_symbols, "Go to symbol", bufnr)
  util.map("n", "<leader>fe", fzf.diagnostics_document, "Search document diagnostics", bufnr)
  util.map("n", "<leader>fE", fzf.diagnostics_workspace, "Search workspace diagnostics", bufnr)

  -- Rename/reword
  util.map("n", "grn", function()
    util.input(vim.lsp.buf.rename, { prompt = "New name: " })
  end, "Rename", bufnr)
  util.map("n", "grw", function()
    util.input(vim.lsp.buf.rename, { prompt = "New name: ", default = vim.fn.expand "<cword>" })
  end, "Reword", bufnr)
end

return M
