-- ~/.config/nvim/lua/plugins/ui.lua
-- UI and visual enhancements

return {
  -- Beautiful colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
        },
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Modern statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            "filename",
            "diagnostics",
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- File icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { ".git", "node_modules", "__pycache__" },
        },
        sync_root_with_cwd = true,
      })
    end,
  },

  -- Buffer tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
        },
      })
    end,
  },

  -- Better UI (input/select dialogs)
  {
    "stevearc/dressing.nvim",
    lazy = true,
    config = function()
      require("dressing").setup({
        input = { relative = "cursor" },
        select = { backend = { "telescope", "fzf", "builtin" } },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
        exclude = {
          filetypes = {
            "dashboard",
            "lazy",
            "mason",
            "NvimTree",
            "help",
            "checkhealth",
          },
          buftypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
          },
        },
      })
    end,
  },

  -- Dashboard/startup screen
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function set_dashboard_highlights()
        local highlights = {
          DashboardHeader = "Title",
          DashboardIcon = "Function",
          DashboardDesc = "String",
          DashboardKey = "Number",
          DashboardShortCut = "Identifier",
          DashboardFooter = "Comment",
        }

        for group, link in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, { link = link, default = false })
        end
      end

      local group = vim.api.nvim_create_augroup("NikaVimDashboard", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_dashboard_highlights,
      })
      set_dashboard_highlights()

      local header_art = {
        "███╗   ██╗██╗██╗  ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██║██║ ██╔╝██╔══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║██║█████╔╝ ███████║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██║██╔═██╗ ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║██║██║  ██╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }

      local header_width = 0
      for _, line in ipairs(header_art) do
        header_width = math.max(header_width, vim.api.nvim_strwidth(line))
      end

      local function center_in_header(text)
        local text_width = vim.api.nvim_strwidth(text)
        local padding = math.max(header_width - text_width, 0)
        local left = math.floor(padding / 2)
        local right = padding - left
        return string.rep(" ", left) .. text .. string.rep(" ", right)
      end

      local dashboard_header = { "" }
      vim.list_extend(dashboard_header, header_art)
      vim.list_extend(dashboard_header, {
        "",
        center_in_header("Fast tools. Clean motion. Your editor, sharpened."),
        "",
      })

      require("dashboard").setup({
        theme = "doom",
        config = {
          header = dashboard_header,
          center = {
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Find files        ",
              desc_hl = "String",
              key = "f",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f f",
              action = "Telescope find_files",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Recent files      ",
              desc_hl = "String",
              key = "r",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f r",
              action = "Telescope oldfiles",
            },
            {
              icon = "󰱼  ",
              icon_hl = "Title",
              desc = "Search text       ",
              desc_hl = "String",
              key = "g",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f g",
              action = "Telescope live_grep",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Open buffers      ",
              desc_hl = "String",
              key = "b",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f b",
              action = "Telescope buffers",
            },
            {
              icon = "󰙅  ",
              icon_hl = "Title",
              desc = "File explorer     ",
              desc_hl = "String",
              key = "e",
              key_hl = "Number",
              key_format = " %s",
              keymap = "CTRL n",
              action = "NvimTreeToggle",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "New file          ",
              desc_hl = "String",
              key = "n",
              key_hl = "Number",
              key_format = " %s",
              action = "ene | startinsert",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Edit config       ",
              desc_hl = "String",
              key = "c",
              key_hl = "Number",
              key_format = " %s",
              action = "edit $MYVIMRC",
            },
            {
              icon = "󰒲  ",
              icon_hl = "Title",
              desc = "Lazy plugins      ",
              desc_hl = "String",
              key = "l",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC l",
              action = "Lazy",
            },
            {
              icon = "󰏖  ",
              icon_hl = "Title",
              desc = "Mason tools       ",
              desc_hl = "String",
              key = "m",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC m",
              action = "Mason",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Quit              ",
              desc_hl = "String",
              key = "q",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC q",
              action = "qa",
            },
          },
          footer = function()
            local version = vim.version()
            local version_text = string.format("Neovim %d.%d.%d", version.major, version.minor, version.patch)
            local stats_text = "Lazy.nvim is getting ready"
            local ok, lazy = pcall(require, "lazy")

            if ok then
              local stats = lazy.stats()
              local loaded = stats.loaded or 0
              local count = stats.count or 0
              local startup_ms = stats.startuptime or 0
              stats_text = string.format("Loaded %d/%d plugins in %.2fms", loaded, count, startup_ms)
            end

            return {
              "",
              "NikaVim • " .. version_text,
              stats_text,
              "Vim motions. Infinite possibilities.",
            }
          end,
          vertical_center = true,
        },
      })
    end,
  },
}
