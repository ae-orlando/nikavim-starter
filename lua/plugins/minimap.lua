return {
  {
    "gorbit99/codewindow.nvim",
    keys = {
      { "<leader>mm", "<cmd>Codewindow toggle<CR>", desc = "Toggle minimap" },
    },
    config = function()
      require("codewindow").setup({
        keymap = {
          toggle = "<leader>mm",
          toggle_maximize = "<leader>mM",
        },
        max_minimap_height = nil,
        max_minimap_width = 15,
        window_border = "none",
        auto_maximize = false,
        behavior = {
          enabled = true,
          priority = false,
          event_source = "other",
          focus = false,
          z_index = 10,
        },
        exclude_filetypes = { "neo-tree" },
      })
    end,
  },
}
