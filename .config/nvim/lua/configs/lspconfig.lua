local lspconfig = require "lspconfig"

local servers = {
  "dockerls",
  -- "fish_lsp",
  "marksman",
  "rust_analyzer",
  "taplo",
  "terraformls",
  "tsserver",
  "yamlls",
}

---@type fun(client:vim.lsp.Client, bufnr:integer)
local on_attach = function(_, bufnr)
  ---@type fun(desc:string):table
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  local map = vim.keymap.set

  map("n", "gd", "<cmd>Trouble close<cr><cmd>Trouble lsp_definitions first<cr>", opts "definitions in project")
  map("n", "gr", "<cmd>Trouble close<cr><cmd>Trouble lsp_references first<cr>", opts "references in project")
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>rn", function()
    vim.ui.input({ prompt = "Rename to: " }, function(input)
      vim.lsp.buf.rename(input)
    end)
  end, opts "Rename")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

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
  ---@param client vim.lsp.Client
  ---@param bufnr integer
  on_attach = function(client, bufnr)
    -- pyright does these better / faster
    client.server_capabilities.referencesProvider = nil
    client.server_capabilities.definitionProvider = nil
    client.server_capabilities.renameProvider = nil
    client.server_capabilities.documentSymbolProvider = nil
    on_attach(client, bufnr)
  end,
}
