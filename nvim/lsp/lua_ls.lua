local root_markers1 = {
  '.emmyrc.json',
  '.luarc.json',
  '.luarc.jsonc',
}
local root_markers2 = {
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
}

local cfg = {
  codeLens = {
    enable = true,
  },
  hint = {
    enable = true,
    semicolon = 'Disable',
  },
  format = {
    enable = true,
    defaultConfig = {
      indent_style = 'space',
      indent = 2,
      quote_style = 'double',
      call_arg_parentheses = 'remove',
      trailing_table_separator = 'always'
    }
  }
}

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers1, root_markers2, { '.git' } }
      or vim.list_extend(vim.list_extend(root_markers1, root_markers2), { '.git' }),
  settings = {
    Lua = cfg,
  },
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', cfg, {
      runtime = {
        version = 'LuaJIT'
      },
      -- Tell the language server how to find Lua modules same way as Neovim
      -- (see `:h lua-module-load`)
      path = {
        'lua/?.lua',
        'lua/?/init.lua',
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        }
      }
    })
  end,
}
