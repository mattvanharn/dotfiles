-- Leader keys must be set before anything that maps against them.
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\' -- backslash: unused in normal mode, so it costs no builtin

require('core.options')
require('core.keymaps')

-- Installs plugins (hooks first, then a single vim.pack.add).
require('pack')

-- Plugin configuration, in load order. Comment a line out to disable one.
require('plugins.tokyonight')
require('plugins.which-key')
