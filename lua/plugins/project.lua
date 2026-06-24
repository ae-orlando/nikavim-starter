return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", "pyproject.toml", "go.mod" },
      })

      require("telescope").load_extension("projects")

      vim.keymap.set("n", "<leader>pp", require("telescope.builtin").projects, { desc = "Find projects" })
    end,
  },
}
