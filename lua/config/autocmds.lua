vim.api.nvim_create_autocmd("User", {
  pattern = "ObsidianNoteEnter",
  callback = function(ev)
    local opts = { buffer = ev.buf }

    -- Remove default mappings
    pcall(vim.keymap.del, "n", "<CR>", opts)
    pcall(vim.keymap.del, "n", "]o", opts)
    pcall(vim.keymap.del, "n", "[o", opts)
    pcall(vim.keymap.del, "n", "]l", opts)
    pcall(vim.keymap.del, "n", "[l", opts)

    -- Custom mappings
    vim.keymap.set(
      "n",
      "<leader><CR>",
      require("obsidian.api").smart_action,
      { buffer = ev.buf, desc = "Obsidian smart action" }
    )
  end,
})

-- Search Obsidian notes
vim.keymap.set("n", "<leader>on", "<cmd>Obsidian search<CR>", {
  desc = "Open Notes",
})
vim.keymap.set("n", "<leader>nn", "<cmd>Obsidian new<CR>", {
  desc = "New note",
})
