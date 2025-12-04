---@type vim.lsp.Config
return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyrightconfig.json',
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    basedpyright = {
      disableOrganizeImports = true, -- Using Ruff's import organizer
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        diagnosticSeverityOverrides = {
          reportAny = false,
          reportExplicitAny = false,
          reportUnusedCallResult = false,
          reportImplicitStringConcatenation = false,
          reportUnknownMemberType = false,
        },
        -- https://docs.basedpyright.com/latest/configuration/language-server-settings/
        -- Explicitly setting `basedpyright.analysis.useLibraryCodeForTypes` is **discouraged** by the official docs.
        -- Because it will override per-project configurations like `pyproject.toml`.
        -- If left unset, its default value is `true`, and it can be correctly overridden by project config files.
      },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.callHierarchyProvider = nil
    client.server_capabilities.codeActionProvider = nil
    client.server_capabilities.codeLensProvider = nil
    client.server_capabilities.colorProvider = nil
    client.server_capabilities.completionProvider = nil
    client.server_capabilities.declarationProvider = nil
    client.server_capabilities.definitionProvider = nil
    client.server_capabilities.documentFormattingProvider = nil
    client.server_capabilities.documentHighlightProvider = nil
    client.server_capabilities.documentLinkProvider = nil
    client.server_capabilities.documentOnTypeFormattingProvider = nil
    client.server_capabilities.documentRangeFormattingProvider = nil
    client.server_capabilities.documentSymbolProvider = nil
    client.server_capabilities.executeCommandProvider = nil
    client.server_capabilities.foldingRangeProvider = nil
    client.server_capabilities.implementationProvider = nil
    client.server_capabilities.inlineCompletionProvider = nil
    client.server_capabilities.inlineValueProvider = nil
    client.server_capabilities.referencesProvider = nil
    client.server_capabilities.renameProvider = nil
    client.server_capabilities.semanticTokensProvider = nil
    client.server_capabilities.typeDefinitionProvider = nil
    client.server_capabilities.typeHierarchyProvider = nil
    client.server_capabilities.workspaceSymbolProvider = nil
  end,
}
