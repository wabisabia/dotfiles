return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
    json = { "jsonformat" },
  },

  formatters = {
    ruff_format = {
      args = {
        "format",
        "--force-exclude",
        "--stdin-filename",
        "$FILENAME",
        "--line-length",
        "120",
        "-",
      },
    },
    ruff_organize_imports = {
      args = {
        "check",
        "--fix",
        "--force-exclude",
        "--select",
        "I001",
        "--exit-zero",
        "--no-cache",
        "--stdin-filename",
        "$FILENAME",
        "--line-length",
        "120",
        "-",
      },
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
