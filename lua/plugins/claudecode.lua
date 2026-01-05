-- Claude Code integration for Neovim
-- Uses coder/claudecode.nvim which implements the same WebSocket MCP protocol
-- as the official VS Code extension for full feature parity
--
-- Toggle with <Leader>ac, send selection with <Leader>as (visual mode)
-- See :help claudecode for more commands

return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    opts = {
      -- Terminal UI configuration
      terminal = {
        split_side = "right",
        split_width_percentage = 0.40,
        provider = "snacks",
        auto_close = true,
      },
      -- Diff handling
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = true,
      },
    },
    keys = {
      { "<Leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<Leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<Leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume session" },
      { "<Leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue session" },
      { "<Leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
      { "<Leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add buffer to context" },
      { "<Leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
      {
        "<Leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker" },
        desc = "Add file to context",
      },
      { "<Leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<Leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },

  -- Register Claude keybindings with which-key for discoverability
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>a"] = { desc = " Claude" },
        },
        v = {
          ["<Leader>a"] = { desc = " Claude" },
        },
      },
    },
  },
}
