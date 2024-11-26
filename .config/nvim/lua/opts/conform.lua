--- require "conform"

return {
  formatters_by_ft = {
    json = { "jsonformat" },
    lua = { "stylua" },
    sh = { "shfmt" },
    yaml = { "yamlfmt" },
    zig = { "zigfmt" },
  },

  ---@type table<string, conform.FormatterConfigOverride>
  formatters = {
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
