return {
  -- Notification toast system
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

  -- UI enhancements (messages, LSP progress, popupmenu)
  -- Does NOT touch the cmdline — native ':' works as normal
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = { enabled = false },
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
        presets = {
          bottom_search = false,
          command_palette = false,
          inc_rename = true,
          lsp_doc_border = true,
        },
        notify = {
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = { enabled = true },
          override = { "vim.lsp.protocol" },
          hover = { enabled = true, view = "hover" },
          signature = { enabled = true, view = "hover" },
          message = { enabled = true, view = "notify" },
        },
        health = { checker = true },
      })
    end,
  },
}
