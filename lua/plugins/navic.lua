return {
  -- LSP-based breadcrumbs
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("nvim-navic").setup({
        highlight = true,
        separator = " > ",
        depth_limit = 5,
        depth_limit_indicator = "..",
      })
    end,
  },

  -- Visual code tree navigation (VS Code Outline equivalent)
  {
    "SmiteshP/nvim-navbuddy",
    keys = {
      { "<leader>nb", "<cmd>Navbuddy<CR>", desc = "Toggle Navbuddy (Outline)" },
      { "<leader>no", "<cmd>Navbuddy<CR>", desc = "Toggle Navbuddy (Outline)" },
    },
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local navbuddy = require("navbuddy")
      navbuddy.setup({
        window = {
          width = "auto",
          height = "auto",
          border = "rounded",
        },
        source_buffer = {
          follow_node = true,
          highlight = true,
          reorient_on_open = true,
          scrolloff = 5,
        },
        lsp = { auto_attach = true },
        use_default_mappings = true,
        mappings = {
          left = "h",
          right = "l",
          down = "j",
          up = "k",
          expand_collapse = "o",
          next_sibling = "J",
          prev_sibling = "K",
          parent = "H",
          root = "0",
        },
      })
    end,
  },

  -- Integrate navic into lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local lualine = require("lualine")
      local navic = require("nvim-navic")

      lualine.setup({
        options = {
          theme = "tokyonight",
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = " ", right = " " },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            {
              "filename",
              path = 1,
              symbols = { modified = " [+]" },
            },
          },
          lualine_c = {
            {
              function()
                return navic.get_location()
              end,
              cond = function()
                return navic.is_available()
              end,
            },
          },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree" },
      })
    end,
  },
}
