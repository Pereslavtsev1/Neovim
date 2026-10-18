return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
  opts = {
    heading = {
      sign = false,
      border = true,
      below = "▔",
      above = "▁",
      left_pad = 0,
      position = "left",
      icons = {
        "█ ",
        "██ ",
        "███ ",
        "████ ",
        "█████ ",
        "██████ ",
      },
    },
    latex = { enabled = false },
  },
}
