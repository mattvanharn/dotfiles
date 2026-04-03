-- avante.nvim overrides — base config provided by LazyExtras ai.avante
-- To switch to Claude API:
--   1. Set AVANTE_ANTHROPIC_API_KEY in ~/.config/secrets.zsh
--   2. Change provider = "claude" and add claude config below
return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "gemini",
      providers = {
        gemini = {
          model = "gemini-3-flash-preview",
          timeout = 30000,
        },
      },
    },
  },
}
