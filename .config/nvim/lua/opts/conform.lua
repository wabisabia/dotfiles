--- require "conform"

return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
    json = { "jsonformat" },
    yaml = { "yamlfmt" },
  },

  ---@type table<string, conform.FormatterConfigOverride>
  formatters = {
    ruff_format = {
      append_args = { "--line-length", "120" },
    },
    ruff_organize_imports = {
      append_args = { "--line-length", "120" },
    },
    jsonformat = {
      command = "jsonformat",
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}
