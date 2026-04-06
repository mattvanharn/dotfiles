-- nvim-pack: scratch Neovim config using vim.pack (Neovim 0.12 built-in plugin manager)
-- Run with: NVIM_APPNAME=nvim-pack nvim

-- Faster Lua module loading via cache. Must be first.
vim.loader.enable()

-- Plugin files live in plugin/ and are auto-sourced alphabetically by Neovim.
-- Options and keymaps also go there, prefixed with numbers to control load order.
