local lspconfig = require "lspconfig"

---@type string[]
local servers = {
  "dockerls",
  -- "fish_lsp",
  -- "jsonls",
  "lua_ls",
  "marksman",
  "rust_analyzer",
  "taplo",
  "terraformls",
  "ts_ls",
  "yamlls",
  "zls",
}

---@type fun(client:vim.lsp.Client, bufnr:integer)
local on_attach = function(_, bufnr)
  ---@type fun(desc:string):table
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  local map = vim.keymap.set

  map("n", "gd", vim.lsp.buf.definition, opts "definitions in project")
  map("n", "gr", "<cmd>Trouble close<cr><cmd>Trouble lsp_references first<cr>", opts "references in project")
  map("n", "gR", "<cmd>Trouble close<cr><cmd>Trouble lsp_references_buffer first<cr>", opts "references in project")
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>rn", function()
    vim.ui.input({ prompt = "Rename to: " }, function(input)
      vim.lsp.buf.rename(input)
    end)
  end, opts "Rename")
  map("n", "<leader>rw", function()
    vim.ui.input({ prompt = "Reword to: ", default = vim.fn.expand "<cword>" }, function(input)
      vim.lsp.buf.rename(input)
    end)
  end, opts "Reword")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
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

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

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
    client.server_capabilities.documentSymbolProvider = nil
    on_attach(client, bufnr)
  end,
}

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
