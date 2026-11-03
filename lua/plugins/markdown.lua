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
    latex = {
      -- Turn on / off latex rendering.
      enabled = true,
      -- Additional modes to render latex.
      render_modes = false,
      -- Executable used to convert latex formula to rendered unicode.
      -- If a list is provided the commands run in order until the first success.
      converter = { "utftex", "latex2text" },
      -- Render inline latex formulas.
      inline = true,
      -- Render block latex formulas.
      block = true,
      -- Highlight for latex blocks.
      highlight = "RenderMarkdownMath",
      -- Determines where latex formula is rendered relative to block.
      -- | above  | above latex block                               |
      -- | below  | below latex block                               |
      -- | center | centered with latex block (must be single line) |
      position = "center",
      -- Number of empty lines above latex blocks.
      top_pad = 0,
      -- Number of empty lines below latex blocks.
      bottom_pad = 0,
    },
  },
}
