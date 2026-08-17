return {
  "folke/sidekick.nvim",
  opts = {
    nes = { enabled = false },
    cli = {
      tools = {
        opencode = {
          cmd = { "opencode2" },
        },
        claude = {
          cmd = {
            "claude",
            "--model",
            "gpt-5.6-sol",
            "--dangerously-skip-permissions",
          },
          env = {
            CLAUDE_CODE_SUBAGENT_MODEL = "gpt-5.6-sol",
            CLAUDE_CODE_ALWAYS_ENABLE_EFFORT = "1",
            CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY = "3",
            ENABLE_TOOL_SEARCH = "false",
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle({ name = "opencode", focus = true })
      end,
      desc = "Sidekick Toggle CLI",
    },
  },
}
