return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash (jump to any visible character)",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({ backward = true })
        end,
        desc = "Flash backward",
      },
    },
    config = function()
      require("flash").setup({
        modes = {
          char = {
            enabled = true,
            jump_labels = true,
            highlight = { backdrop = true, label = "FlashLabel" },
          },
          search = {
            enabled = true,
            highlight = { backdrop = true, label = "FlashLabel" },
          },
        },
        label = {
          uppercase = false,
          rainbow = {
            enabled = true,
            shade = 5,
          },
        },
      })
    end,
  },
}
