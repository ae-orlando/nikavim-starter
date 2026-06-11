-- ~/.config/nvim/lua/plugins/editing.lua
-- Editing utilities and enhancements

return {
  -- Easy comments
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt" },
      })
    end,
  },

  -- Surround with brackets, quotes, etc.
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "BufReadPost",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Extend % motions (match-up)
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Undo tree visualization
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undo tree" },
    },
  },

  -- Better incremental search
  {
    "kevinhwang91/nvim-hlslens",
    keys = { { "/", desc = "Search" } },
    config = function()
      require("hlslens").setup()
    end,
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    event = "BufReadPost",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({})
    end,
  },

  -- Smart text objects
  {
    "echasnovski/mini.ai",
    version = false,
    event = "BufReadPost",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
    end,
  },
}
