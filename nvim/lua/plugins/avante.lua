-- avante.nvim — Cursor-like AI editing inside neovim
-- Uses Gemini free tier by default. To switch to Claude API:
--   1. Set AVANTE_ANTHROPIC_API_KEY in ~/.config/secrets.zsh
--   2. Change provider = "claude" below
return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "gemini",
      providers = {
        gemini = {
          -- Check aistudio.google.com for the latest stable model name
          model = "gemini-2.5-flash-preview-05-20",
          timeout = 30000,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
