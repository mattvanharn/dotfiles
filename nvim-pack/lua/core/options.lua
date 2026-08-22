local o = vim.o

-- Line numbers
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true

-- Indentation: Python-style default; ftplugin overrides per language
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- Search
o.ignorecase = true
o.smartcase = true
o.inccommand = 'split'

-- Wrapping: off for code, but keep words intact when a filetype turns it on
o.wrap = false
o.linebreak = true
o.breakindent = true

-- Scrolling context
o.scrolloff = 8
o.sidescrolloff = 8

-- Splits open where the eye expects them
o.splitbelow = true
o.splitright = true

-- Persistent undo across sessions
o.undofile = true

-- Floating windows and the completion popup get borders globally
o.winborder = 'rounded'
o.pumborder = 'rounded'
o.pumheight = 12

-- CursorHold fires at 200ms, driving LSP hover/highlight and gitsigns blame
o.updatetime = 200
o.timeoutlen = 400

-- Prompt to save instead of erroring on :q with unsaved changes
o.confirm = true

-- Show whitespace that matters in Python
o.list = true
o.listchars = 'tab:» ,trail:·,nbsp:␣'

o.showmode = false

-- Folding via treesitter. vim.treesitter.foldexpr is a core function and works
-- with Neovim's bundled parsers, so this does not depend on nvim-treesitter.
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldlevel = 99
