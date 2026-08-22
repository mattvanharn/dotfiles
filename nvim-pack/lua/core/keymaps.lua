local map = vim.keymap.set

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- System clipboard, opt-in (we intentionally do not set 'clipboard')
map({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' })
map({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

-- Delete/replace without clobbering the unnamed register
map({ 'n', 'x' }, '<leader>d', '"_d', { desc = 'Delete to void register' })
map('x', '<leader>P', '"_dP', { desc = 'Paste over selection, keep register' })

-- Move selected lines and reindent
map('x', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
map('x', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })

-- Keep selection after indenting
map('x', '<', '<gv', { desc = 'Indent left, keep selection' })
map('x', '>', '>gv', { desc = 'Indent right, keep selection' })

-- Keep the cursor centered while scrolling and searching
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down, centered' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up, centered' })
map('n', 'n', 'nzzzv', { desc = 'Next match, centered' })
map('n', 'N', 'Nzzzv', { desc = 'Previous match, centered' })

-- Leave terminal-insert mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
