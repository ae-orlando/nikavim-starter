-- ~/.config/nvim/lua/plugins/formatting.lua
-- Code formatting and linting

return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          markdown = { "prettier" },
          yaml = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>fp", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format code" })
    end,
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        python = { "pylint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        markdown = { "markdownlint" },
        lua = { "luacheck" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>fl", function()
        lint.try_lint()
      end, { desc = "Lint file" })
    end,
  },
}
