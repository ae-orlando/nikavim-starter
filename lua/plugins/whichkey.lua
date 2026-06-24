return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "modern",
        icons = {
          group = "",
        },
        spec = {
          { "<leader>a", group = "AI" },
          { "<leader>d", group = "Debug" },
          { "<leader>f", group = "Format / Find" },
          { "<leader>g", group = "Git" },
          { "<leader>h", group = "Harpoon" },
          { "<leader>k", group = "Keys (screencast)" },
          { "<leader>m", group = "Mason" },
          { "<leader>n", group = "Nav" },
          { "<leader>o", group = "Octo (GitHub)" },
          { "<leader>r", group = "Tasks" },
          { "<leader>s", group = "Search" },
          { "<leader>t", group = "Test / Terminal" },
          { "<leader>z", group = "Zen / Focus" },
          { "<leader>D", group = "Database" },
          { "<leader>L", group = "LSP Extras" },
          { "<leader>R", group = "REST" },
          { "<leader>S", group = "Session" },
        },
      })
    end,
  },
}
