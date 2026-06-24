return {
  {
    "pwntester/octo.nvim",
    cmd = { "Octo" },
    keys = {
      { "<leader>gi", "<cmd>Octo issue list<CR>", desc = "List GitHub issues" },
      { "<leader>gpr", "<cmd>Octo pr list<CR>", desc = "List pull requests" },
      { "<leader>gprv", "<cmd>Octo pr view<CR>", desc = "View pull request" },
      { "<leader>gpc", "<cmd>Octo pr checkout<CR>", desc = "Checkout PR" },
      { "<leader>gpm", "<cmd>Octo pr merge<CR>", desc = "Merge PR" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        default_remote = { "origin", "upstream" },
        ssh_aliases = {},
        picker = "telescope",
        default_to_clipboard = true,
        use_local_fs = false,
        enable_builtin = true,
        mappings = {
          issue = {
            close_issue = { lhs = "<leader>gx", desc = "close issue" },
            reopen_issue = { lhs = "<leader>gX", desc = "reopen issue" },
            next_comment = { lhs = "]g", desc = "next comment" },
            prev_comment = { lhs = "[g", desc = "previous comment" },
          },
          pull_request = {
            close_pr = { lhs = "<leader>gx", desc = "close PR" },
            reopen_pr = { lhs = "<leader>gX", desc = "reopen PR" },
            next_comment = { lhs = "]g", desc = "next comment" },
            prev_comment = { lhs = "[g", desc = "previous comment" },
          },
        },
      })
    end,
  },
}
