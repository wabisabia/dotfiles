---@type vim.lsp.Config
return {
  cmd = { 'postgres-language-server', 'lsp-proxy' },
  filetypes = { 'sql' },
  root_markers = { 'postgres-language-server.jsonc' },
  workspace_required = true,
  settings = {
    db = {
      host = '127.0.0.1',
    }
  },
}
