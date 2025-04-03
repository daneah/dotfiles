return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      sources = {
        default = { "lsp", "path", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust" }
    }
  },
}
