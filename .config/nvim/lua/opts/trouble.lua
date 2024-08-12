return {
  modes = {
    lsp_base = {
      auto_close = true,
      auto_refresh = false,
      auto_jump = false,
      focus = true,
    },
    lsp_definitions = {
      auto_jump = false,
    },
    lsp_references_buffer = {
      mode = "lsp_references",
      filter = {
        buf = 0,
      },
    },
  },
}
