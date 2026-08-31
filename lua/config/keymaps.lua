-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<c-a>", "ggVG")
keymap.set("n", "<leader>q!", "<cmd>q<cr>")
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("i", "<C-BS>", "<C-w>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
-- Move selected string
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Increment / Decrement 111
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

keymap.set("n", "<C-h>", "<cmd>vertical resize -1<CR>", { desc = "Resize window left" })
keymap.set("n", "<C-l>", "<cmd>vertical resize +1<CR>", { desc = "Resize window right" })
keymap.set("n", "<C-j>", "<cmd>resize -1<CR>", { desc = "Resize window down" })
keymap.set("n", "<C-k>", "<cmd>resize +1<CR>", { desc = "Resize window up" })
