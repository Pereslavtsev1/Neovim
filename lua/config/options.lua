-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.conceallevel = 1
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.hlsearch = true
opt.incsearch = true
opt.spell = true
opt.spelllang = "en_us"
opt.termguicolors = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.autoread = true
vim.g.snacks_animate = false
vim.opt.laststatus = 3
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

if vim.g.neovide then
  vim.o.guifont = "JetbrainsMono Nerd Font:h12:b:i"
  vim.g.neovide_scale_factor = 1
  vim.g.neovide_fullscreen = false
  vim.g.neovide_opacity = 0.4
  vim.g.transparency = 0
  vim.g.neovide_position_animation_length = 0.15
  -- animation
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
  -- dynamic scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  vim.keymap.set("n", "<D-=>", function()
    change_scale_factor(1.25)
  end)

  vim.keymap.set("n", "<D-->", function()
    change_scale_factor(1 / 1.25)
  end)
end
-- Make Snacks UI bold
vim.api.nvim_set_hl(0, "SnacksPicker", { bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerPrompt", { bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerInput", { bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerList", { bold = true })
vim.api.nvim_set_hl(0, "SnacksPickerPreview", { bold = true })
vim.api.nvim_set_hl(0, "SnacksNotifierTitle", { bold = true })
vim.api.nvim_set_hl(0, "SnacksNotifierIcon", { bold = true })
