---require("lazy")
---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = "hrsh7th/nvim-cmp",
  config = function()
    local lspconfig = require "lspconfig"
    local lsp = require "lsp"

    ---@type string[]
    local servers = {
      "bashls",
      "cssls",
      "dockerls",
      "gdscript",
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

    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    vim.lsp.handlers = vim.tbl_deep_extend("force", vim.lsp.handlers, handlers)

    for _, ls in ipairs(servers) do
      lspconfig[ls].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
    end

    -- lua

    lspconfig.lua_ls.setup {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {
          format = {
            defaultConfig = {
              indent_style = "space",
              indent = 2,
              quote_style = "double",
              call_arg_parentheses = "remove",
              trailing_table_separator = "always"
            }
          }
        }
      }
    }

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

    lspconfig.basedpyright.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        basedpyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
          analysis = {
            diagnosticMode = "workspace",
            diagnosticSeverityOverrides = {
              reportAny = false,
              reportExplicitAny = false,
              reportUnusedCallResult = false,
            },
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
  end,
}
