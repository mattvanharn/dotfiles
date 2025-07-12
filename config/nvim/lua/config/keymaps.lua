-- ------------------------------------------------------------------------------------------------
-- File: lua/config/keymaps.lua
-- Desc: Custom keyboard shortcuts and workflow accelerators
-- ------------------------------------------------------------------------------------------------

local map = vim.keymap.set

-- Leader key setup (MUST be set before plugin loading)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffer Management
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Window Management
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close window:" })

-- Search Utilities
map("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Editing Shortcuts
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Plugin Management
map("n", "<leader>pl", ":Lazy<CR>", { desc = "Plugin Manager" })
map("n", "<leader>ps", ":Lazy sync<CR>", { desc = "Sync Plugins" })
