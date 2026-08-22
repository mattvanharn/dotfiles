-- Build hooks MUST be registered before the first vim.pack.add() call, so they
-- also fire during a cold bootstrap (fresh clone, no plugins on disk yet).
local hooks = vim.api.nvim_create_augroup('pack.hooks', { clear = true })

vim.api.nvim_create_autocmd('PackChanged', {
  group = hooks,
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    -- Placeholder: real hooks (e.g. :TSUpdate) get added as plugins arrive.
    vim.schedule(function()
      vim.notify(('pack: %s (%s)'):format(name, kind), vim.log.levels.INFO)
    end)
  end,
})

local function gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add({
  gh('folke/tokyonight.nvim'),
  gh('folke/which-key.nvim'),
}, { confirm = false })
