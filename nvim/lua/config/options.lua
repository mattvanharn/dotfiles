-- Custom options — these override LazyVim defaults.
-- LazyVim already sets: number, relativenumber, expandtab, clipboard=unnamedplus
-- so you only need to add things that differ from LazyVim's defaults.

-- 2-space indent (LazyVim defaults to 2, but being explicit is fine)
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Use our own trouble lualine component (no kind icon, avoids colored rectangle)
vim.g.trouble_lualine = false
