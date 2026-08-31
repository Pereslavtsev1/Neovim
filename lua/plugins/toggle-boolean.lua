return {
  lazy = false,
  "rmagatti/alternate-toggler",
  opts = {
    alternates = {
      ["==="] = "!==",
      ["=="] = "!=",
      ["error"] = "warn",
    },
    vim.keymap.set("n", "<leader>t", "<cmd>ToggleAlternate<cr>"),
  },
}
