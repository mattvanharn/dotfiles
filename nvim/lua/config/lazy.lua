-- Plugin specs: LazyVim framework + your custom plugins from lua/plugins/
require("lazy").setup({
  spec = {
    -- LazyVim framework — provides LSP, treesitter, completions, UI, etc.
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Your custom plugin overrides and additions go in lua/plugins/*.lua
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- plugins load at startup by default
    version = false, -- use latest git commits (recommended by LazyVim)
  },
  checker = { enabled = true }, -- auto-check for plugin updates
  performance = {
    rtp = {
      -- disable built-in plugins you don't need (LazyVim default)
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
