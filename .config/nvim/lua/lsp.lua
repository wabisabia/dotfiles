local util = require "util"

M = {}

---@type fun(bufnr: integer)
M.set_common_lsp_keymaps = function(bufnr)
  -- Navigation
  util.map("n", "gd", vim.lsp.buf.definition, "definitions in project", bufnr)
  util.map("n", "gD", vim.lsp.buf.declaration, "Go to declaration", bufnr)
  util.map("n", "gi", vim.lsp.buf.implementation, "Go to implementation", bufnr)
  util.map("n", "gr", "<cmd>Trouble close<cr><cmd>Trouble lsp_references first<cr>", "references in project", bufnr)
  util.map(
    "n",
    "gR",
    "<cmd>Trouble close<cr><cmd>Trouble lsp_references_buffer first<cr>",
    "references in buffer",
    bufnr
  )

  -- Rename/reword
  util.map("n", "<leader>rn", function()
    util.input(vim.lsp.buf.rename, { prompt = "Rename: " })
  end, "Rename", bufnr)
  util.map("n", "<leader>rw", function()
    util.input(vim.lsp.buf.rename, { prompt = "Reword: ", default = vim.fn.expand "<cword>" })
  end, "Reword", bufnr)

  -- Workspace operations
  util.map("n", "<leader>wa", function()
    util.input(vim.lsp.buf.add_workspace_folder, { prompt = "New workspace folder: " })
  end, "Add workspace folder", bufnr)
  util.map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder", bufnr)
  util.map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders", bufnr)

  util.map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "List code actions", bufnr)
end

return M
