-- leaf.nvim colorscheme — clean, light, nature-inspired.
-- transparent = true means neovim uses kitty's background instead of its own.
return {
  {
    "daschw/leaf.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"
      require("leaf").setup({
        theme = "auto",       -- follows vim.opt.background
        transparent = true,   -- use kitty's background
        contrast = "low",
        commentStyle = "italic",
        keywordStyle = "italic",
        statementStyle = "bold",
      })
      vim.cmd("colorscheme leaf")
    end,
  },

  -- Tell LazyVim not to override our colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "leaf",
    },
  },
}
