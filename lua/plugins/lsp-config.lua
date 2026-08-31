return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Spell checker
      cspell = {
        cmd = { "cspell-lsp", "--stdio" },
        filetypes = {
          "go",
          "rust",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "yaml",
          "markdown",
          "gitcommit",
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(".git")(fname)
        end,
      },
    },
  },
}
