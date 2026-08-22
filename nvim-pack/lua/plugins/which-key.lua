require('which-key').setup({
  preset = 'helix',
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
})

require('which-key').add({
  { '<leader>y', desc = 'Yank to system clipboard' },
  { '<leader>p', desc = 'Paste from system clipboard' },
  { '<leader>d', desc = 'Delete to void register' },
})
