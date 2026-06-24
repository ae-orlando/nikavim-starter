return {
  {
    "NStefan002/screenkey.nvim",
    keys = {
      { "<leader>kx", "<cmd>Screenkey<CR>", desc = "Toggle screenkey" },
    },
    config = function()
      require("screenkey").setup({
        win_config = {
          relative = "editor",
          width = 60,
          height = 3,
          row = 1,
          col = 1,
          style = "minimal",
          border = "rounded",
        },
        display = {
          max_key_combo = 8,
          group_mappings = true,
          timer = 2000,
        },
      })
    end,
  },
}
