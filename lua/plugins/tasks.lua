return {
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerBuild" },
    keys = {
      { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run task" },
      { "<leader>rb", "<cmd>OverseerBuild<CR>", desc = "Build" },
      { "<leader>rt", "<cmd>OverseerToggle<CR>", desc = "Toggle task panel" },
      { "<leader>rq", "<cmd>OverseerQuickAction<CR>", desc = "Quick action" },
      { "<leader>ro", "<cmd>OverseerOutput<CR>", desc = "Open task output" },
    },
    config = function()
      require("overseer").setup({
        templates = { "builtin" },
        strategy = "toggleterm",
        task_list = {
          direction = "bottom",
          min_height = 8,
          max_height = 16,
          default_detail = "full",
        },
        component_aliases = {
          default = {
            { "display_duration", detail_level = "detail" },
            "on_output_summarize",
            "on_result_diagnostics",
          },
        },
        confirm = {
          name = "default",
          params = false,
        },
      })
    end,
  },
}
