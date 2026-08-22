-- Build hooks MUST be registered before the first vim.pack.add() call, so they
-- also fire during a cold bootstrap (fresh clone, no plugins on disk yet).
local hooks = vim.api.nvim_create_augroup('pack.hooks', { clear = true })

vim.api.nvim_create_autocmd('PackChanged', {
  group = hooks,
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name ~= 'nvim-treesitter' or kind == 'delete' then
      return
    end
    -- On a cold install the plugin is on disk but not yet loaded.
    if not ev.data.active then
      pcall(vim.cmd.packadd, 'nvim-treesitter')
    end
    -- Parsers and queries are versioned together; a stale parser breaks queries.
    require('nvim-treesitter').update(nil, { summary = true }):wait(300000)
  end,
})

local function gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add({
  gh('folke/tokyonight.nvim'),
  gh('folke/which-key.nvim'),
  gh('nvim-treesitter/nvim-treesitter'),
  gh('neovim/nvim-lspconfig'),
}, { confirm = false })
