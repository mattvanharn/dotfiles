local ts = require('nvim-treesitter')

-- Parsers + queries to keep installed. Neovim bundles only c, lua, markdown,
-- markdown_inline, query, vim and vimdoc; everything else comes from here.
local languages = {
  'bash',
  'diff',
  'gitcommit',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'regex',
  'sql',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}

local installed = ts.get_installed('parsers')
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(installed, lang)
end, languages)

-- Asynchronous, so a cold start is not blocked on compiling parsers.
if #missing > 0 then
  ts.install(missing, { summary = true })
end

-- nvim-treesitter only supplies parsers and queries; core does the rest.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter.enable', { clear = true }),
  callback = function(ev)
    -- Fails when no parser is installed for this filetype, which is fine.
    if not pcall(vim.treesitter.start, ev.buf) then
      return
    end
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
