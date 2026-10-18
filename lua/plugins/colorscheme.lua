local matugen_path = vim.fn.stdpath("config") .. "/matugen_colors.lua"
local overrides = {}

if vim.fn.filereadable(matugen_path) == 1 then
  local chunk = loadfile(matugen_path)
  if chunk then
    local colors = chunk()
    if type(colors) == "table" then
      overrides = { all = colors, mocha = colors }
    end
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      background = {
        dark = "mocha",
        light = "latte",
      },
      float = {
        transparent = true,
        solid = false,
      },
      compile = { enabled = false },
      color_overrides = overrides,
      styles = {
        comments = { "italic", "bold" },
        conditionals = { "italic", "bold" },
        loops = { "bold" },
        functions = { "bold" },
        keywords = { "bold" },
        strings = { "bold" },
        variables = { "bold" },
        numbers = { "bold" },
        booleans = { "bold" },
        properties = { "bold" },
        types = { "bold" },
        operators = { "bold" },
        miscs = { "bold" },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        bufferline = true,
        telescope = { enabled = true },
        indent_blankline = { enabled = true },
        snacks = {
          enabled = false,
          indent_scope_color = "",
        },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd("colorscheme catppuccin")

      local function set_snacks_bold()
        for _, group in ipairs({
          -- Picker: files and directories
          "SnacksPickerDir",
          "SnacksPickerFile",
          "SnacksPickerMatch",
          "SnacksPickerTree",
          "SnacksPickerPathHidden",
          "SnacksPickerPathIgnored",
          "SnacksPickerPath",
          "SnacksPickerGitStatus",

          -- Git status
          "SnacksPickerGitStatusAdded",
          "SnacksPickerGitStatusModified",
          "SnacksPickerGitStatusDeleted",
          "SnacksPickerGitStatusRenamed",
          "SnacksPickerGitStatusUntracked",
          "SnacksPickerGitStatusIgnored",
          "SnacksPickerGitStatusUnmerged",

          -- Picker UI
          "SnacksPickerTitle",
          "SnacksPickerPrompt",
          "SnacksPickerInput",
          "SnacksPickerList",
          "SnacksPickerPreview",
          "SnacksPickerPreviewTitle",
          "SnacksPickerBorder",
          "SnacksPickerToggle",
          "SnacksPickerSelected",
          "SnacksPickerCursorLine",

          -- Explorer
          "SnacksExplorerTitle",
          "SnacksExplorerDir",
          "SnacksExplorerFile",
          "SnacksExplorerGitStatus",

          -- Dashboard
          "SnacksDashboardTitle",
          "SnacksDashboardHeader",
          "SnacksDashboardKey",
          "SnacksDashboardDesc",
          "SnacksDashboardIcon",

          -- Notifications
          "SnacksNotifierTitle",
          "SnacksNotifierMessage",
          "SnacksNotifierIcon",

          -- Indent
          "SnacksIndent",
          "SnacksIndentScope",
        }) do
          local hl = vim.api.nvim_get_hl(0, {
            name = group,
            link = false,
          })
          hl.bold = true
          vim.api.nvim_set_hl(0, group, hl)
        end
      end

      set_snacks_bold()

      _G.reload_matugen_colors = function()
        vim.schedule(function()
          local fresh_path = vim.fn.stdpath("config") .. "/matugen_colors.lua"
          local fresh_overrides = {}

          if vim.fn.filereadable(fresh_path) == 1 then
            local chunk = loadfile(fresh_path)
            if chunk then
              local colors = chunk()
              if type(colors) == "table" then
                fresh_overrides = { all = colors, mocha = colors }
              end
            end
          end

          for k, _ in pairs(package.loaded) do
            if k:match("^catppuccin") then
              package.loaded[k] = nil
            end
          end

          vim.cmd("hi clear")
          if vim.fn.exists("syntax_on") then
            vim.cmd("syntax reset")
          end
          vim.g.colors_name = nil

          opts.color_overrides = fresh_overrides
          require("catppuccin").setup(opts)
          vim.cmd("colorscheme catppuccin")

          local ok_lualine, lualine = pcall(require, "lualine")
          if ok_lualine then
            lualine.setup({ options = { theme = "catppuccin-nvim" } })
          end

          vim.cmd("redraw!")
          vim.notify("Matugen colors reloaded!", vim.log.levels.INFO)
        end)
      end
    end,
  },
}
