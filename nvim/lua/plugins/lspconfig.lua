---require("lazy")
---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  version = "*",
  dependencies = "hrsh7th/nvim-cmp",
  config = function()
    ---@type string[]
    local servers = {
      "bashls",
      "cssls",
      "dockerls",
      "gdscript",
      "lua_ls",
      "marksman",
      "basedpyright",
      "ruff",
      "taplo",
      "terraformls",
      "typos_lsp",
      "ts_ls",
      "yamlls",
      "zls",
    }

    for _, ls in ipairs(servers) do
      vim.lsp.enable(ls)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local lsp = require "lsp"
        lsp.config(args.buf)
      end
    })

    vim.lsp.config('lua_ls', {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
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
    })

    vim.lsp.config("basedpyright", {
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
              reportImplicitStringConcatenation = false,
            },
          },
        },
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          format = {
            proseWrap = "Always",
            printWidth = 120,
          },
        },
      },
    })
  end,
}
