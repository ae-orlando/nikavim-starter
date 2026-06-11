-- ~/.config/nvim/lua/plugins/git.lua
-- Git integration

return {
  -- Git signs (show changes in gutter)
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")
          local map = vim.keymap.set
          local opts = { buffer = bufnr }

          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end, opts)
          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end, opts)

          map("n", "<leader>hs", gitsigns.stage_hunk, opts)
          map("n", "<leader>hu", gitsigns.undo_stage_hunk, opts)
          map("n", "<leader>hr", gitsigns.reset_hunk, opts)
          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, opts)
          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, opts)

          map("n", "<leader>hp", gitsigns.preview_hunk, opts)
          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end, opts)
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame, opts)
          map("n", "<leader>hd", gitsigns.diffthis, opts)
        end,
      })
    end,
  },

  -- Git commands
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "GBrowse" },
    keys = {
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gl", ":Git log<CR>", desc = "Git log" },
      { "<leader>gd", ":Git diff<CR>", desc = "Git diff" },
      { "<leader>gs", ":Git status<CR>", desc = "Git status" },
    },
  },
}
