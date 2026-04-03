-- claudecode.nvim — Claude Code CLI integrated directly into neovim
-- Claude can see your open files, selections, and diagnostics.
-- Avoids keybind conflicts with avante (which also uses <leader>a prefix).
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {},
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Claude: continue last chat" },
      { "<leader>aR", "<cmd>ClaudeCodeResume<cr>", desc = "Claude: resume task" },
      { "<leader>am", "<cmd>ClaudeCodeModel<cr>", desc = "Claude: select model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd<cr>", desc = "Claude: add buffer as context" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = { "n", "v" }, desc = "Claude: send selection" },
    },
  },
}
