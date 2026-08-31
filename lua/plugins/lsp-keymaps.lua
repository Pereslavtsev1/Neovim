return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "K", false },
          { "<leader>r", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
          { "<leader>i", vim.lsp.buf.hover, desc = "Hover" },
          { "<leader>a", vim.lsp.buf.code_action, desc = "Code actions" },
          { "gd", vim.lsp.buf.definition, desc = "Go to definition", has = "definition" },
        },
      },
    },
  },
}
