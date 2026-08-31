return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-T>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },

      ["<C-L>"] = {
        function(cmp)
          cmp.show({ providers = { "lsp" } })
        end,
      },
    },
    sources = {
      providers = {
        lsp = {
          min_keyword_length = 0,
        },
      },
    },
    completion = {
      documentation = {
        window = {
          border = "none",
          winblend = 100,
        },
      },
      menu = {
        border = "none",
        winblend = 100,
      },
    },
  },
}
