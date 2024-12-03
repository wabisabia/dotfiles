return {
  "iamcco/markdown-preview.nvim",
  version = "*",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_port = 9000
    vim.g.mkdp_refresh_slow = 1
  end,
  ft = { "markdown" },
}
