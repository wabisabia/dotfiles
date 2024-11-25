local lspconfig = require "lspconfig"
local lsp = require "lsp"

---@type string[]
local servers = {
  "bashls",
  "dockerls",
  -- "fish_lsp",
  -- "jsonls",
  "lua_ls",
  "marksman",
  "taplo",
  "terraformls",
  "ts_ls",
  "yamlls",
  "zls",
}

---@type fun(client:vim.lsp.Client, bufnr:integer)
local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
  lsp.set_common_lsp_keymaps(bufnr)
end

local cmp_lsp = require "cmp_nvim_lsp"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument = cmp_lsp.default_capabilities().textDocument

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- local border = {
--   { "╭", "FloatBorder" },
--   { "─", "FloatBorder" },
--   { "╮", "FloatBorder" },
--   { "│", "FloatBorder" },
--   { "╯", "FloatBorder" },
--   { "─", "FloatBorder" },
--   { "╰", "FloatBorder" },
--   { "│", "FloatBorder" },
-- }

-- local handlers = {
--   ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
--   ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
-- }

for _, ls in ipairs(servers) do
  lspconfig[ls].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

-- python

lspconfig.ruff.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd_env = { RUFF_TRACE = "messages" },
  settings = {
    args = {
      "--line-length=120",
    },
  },
  init_options = {
    settings = {
      logLevel = "debug",
    },
  },
}

lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "strict",
      },
    },
  },
}

lspconfig.jedi_language_server.setup {
  capabilities = capabilities,
  ---@type fun(client:vim.lsp.Client, bufnr:integer)
  on_attach = function(client, bufnr)
    -- pyright does these better / faster
    client.server_capabilities.referencesProvider = nil
    client.server_capabilities.definitionProvider = nil
    client.server_capabilities.renameProvider = nil
    -- XXX: jedi_language_server hovers are better syntax-highlighted, configure to preference
    client.server_capabilities.hoverProvider = nil
    -- XXX: pyright provides less granular symbols, configure to preference
    -- client.server_capabilities.documentSymbolProvider = nil
    on_attach(client, bufnr)
  end,
}

-- yaml

lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    yaml = {
      format = {
        proseWrap = "Always",
        printWidth = 120,
      },
    },
  },
}
