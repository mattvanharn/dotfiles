-- ------------------------------------------------------------------------------------------------
-- File: lua/config/options.lua
-- Desc: Fundamental editor settings and behavior configurations
-- ------------------------------------------------------------------------------------------------

local opt = vim.opt

-- UI Settings
opt.number = true					                        -- Show line numbers
opt.relativenumber = true		        	            -- Show relative line numbers
opt.cursorline = true				        	            -- Highlight current line
opt.termguicolors = true		        	            -- Enable 24-bit colors
opt.signcolumn = "yes"			        	            -- Always show sign column
opt.colorcolumn = "100"			        	            -- Show column at 100 characters
opt.showmode = false				        	            -- Don't show mode in command line

-- Indentation
opt.tabstop = 2						                        -- Number of spaces tabs count for
opt.shiftwidth = 2					                      -- Size of an indent
opt.expandtab = true				                      -- Use spaces instead of tabs
opt.smartindent = true			        	            -- Smart auto-indenting
opt.autoindent = true				        	            -- Copy indent from current line

-- Search settings
opt.ignorecase = true				        	            -- Case insensitive search
opt.smartcase = true				        	            -- Case sensitive if uppercase in search
opt.hlsearch = false				        	            -- Don't highlight search results
opt.incsearch = true				        	            -- Show matches as you type

-- Window Behavior
opt.splitbelow = true				        	            -- Horizontal splits go below
opt.splitright = true				        	            -- Vertical splits go right
opt.scrolloff = 10					                      -- Minimum lines to keep above/below cursor
opt.sidescrolloff = 8				        	            -- Minimum columns to keep left/right of cursor

-- File Handling
opt.backup = false					                      -- Don't create backup files
opt.writebackup = false			        	            -- Don't create backup before writing
opt.swapfile = false				        	            -- Don't create swap files
opt.undofile = true					                      -- Persistent undo
opt.undodir = vim.fn.expand("~/.vim/undodir")   	-- Undo directory
opt.updatetime = 300					                    -- Faster completion

-- Performance
opt.lazyredraw = true					                    -- Don't redraw during macros
opt.synmaxcol = 300					                      -- Syntax highlighting limit

-- Clipboard
opt.clipboard = "unnamedplus" 				            -- Use system clipboard

-- Folding
opt.foldmethod = "expr"					                  -- Use expression for folding
opt.foldexpr = "nvim_treesitter#foldexpr()"		    -- Use treesitter for folding
opt.foldlevel = 99					                      -- Start with all folds open

-- Command Line
opt.cmdheight = 1					                        -- Command line height
opt.completeopt = "menuone,noinsert,noselect"		  -- Completion options
opt.wildmenu = true					                      -- Enhanced command-line completion
opt.wildmode = "longest:full,full"			          -- Completion behavior
