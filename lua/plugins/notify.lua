return {
  -- Notification toast system (VS Code notification area equivalent)
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        fps = 60,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 2000,
        top_down = true,
      })
      vim.notify = notify
    end,
  },

  -- Modern cmdline popup (VS Code command palette aesthetic)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline",
          opts = {},
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
            filter = { pattern = "^:%s*", icon = "", lang = "vim" },
            lua = { pattern = "^:", icon = "", lang = "lua" },
            help = { pattern = "^:%s*", icon = "", lang = "vim" },
          },
        },
        messages = {
          enabled = true,
          view = "notify",
          view_error = "notify",
          view_warn = "notify",
        },
        popupmenu = {
          enabled = true,
          backend = "nui",
        },
        redirect = {
          view = "popup",
          filter = { event = "msg_show" },
        },
        presets = {
          bottom_search = false,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          },
        },
        notify = {
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
            format = "lsp",
            throttled = 500,
          },
          override = {
            "vim.lsp.protocol",
          },
          hover = {
            enabled = true,
            view = "hover",
          },
          signature = {
            enabled = true,
            view = "hover",
          },
          message = {
            enabled = true,
            view = "notify",
          },
        },
        markdown = {
          hover = { enabled = true },
          signature = { enabled = true },
        },
        health = {
          checker = true,
        },
      })
    end,
  },
}
