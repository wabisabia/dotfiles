---@type vim.lsp.Config
return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'ty.toml', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.inlayHintProvider = false
  end
}
