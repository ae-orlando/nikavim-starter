# 🛸 NikaVim

<p align="center">
  <img src="images/header.png" alt="NikaVim Header" width="600">
</p>

<p align="center">
  <strong>A blazing-fast, modular Neovim distribution for everyday development.</strong><br>
  39 features · 30 plugin modules · 16 ms startup · Full IDE
</p>

<p align="center">
  <img src="images/maindashboard.png" alt="NikaVim Dashboard" width="700">
</p>

---

## ✨ Features

### 🔧 Core
| Area | What's included |
|------|----------------|
| **Package management** | Lazy.nvim with smart lazy-loading |
| **Language servers** | Mason-managed: `lua_ls`, `pyright`, `ts_ls`, `html`, `cssls`, `jsonls`, `yamlls`, `bashls`, `clangd`, `rust_analyzer` |
| **Completion** | nvim-cmp + LuaSnip + friendly-snippets + buffer/path/LSP sources |
| **Formatting** | conform.nvim (auto-format on save, 500ms debounce) |
| **Linting** | nvim-lint (`pylint`, `eslint_d`, `markdownlint`, `luacheck`) |
| **Syntax highlighting** | Tree-sitter (14 languages ensured, text objects, incremental selection) |

### 🔍 Navigation & Search
| Feature | Plugin | Keybind |
|---------|--------|---------|
| File search | Telescope + fzf-native | `<Space>ff` |
| Text search | Telescope live_grep | `<Space>fg` |
| Flash jump | flash.nvim | `s` / `S` |
| File bookmarks | Harpoon | `<Space>ha` / `hh` |
| Breadcrumbs | nvim-navic | (in statusline) |
| Code outline | nvim-navbuddy | `<Space>nb` |
| Buffer tabs | bufferline.nvim | `<Tab>` / `<S-Tab>` |

### 💻 Code Intelligence
| Feature | Plugin | Keybind |
|---------|--------|---------|
| Go to definition | LSP built-in | `gd` |
| Hover docs | LSP built-in | `K` |
| Rename with preview | inc-rename.nvim | `<Space>rn` |
| Code actions | LSP built-in | `<F4>` |
| Code lens | LSP built-in | `<Space>Lc` |
| Call hierarchy | LSP built-in | `<Space>Li` / `Lo` |
| Inlay hints | LSP built-in | (automatic) |
| Diagnostics | trouble.nvim | `<Space>xx` |
| Todo highlights | todo-comments.nvim | `]t` / `[t` |

### 🧪 Testing & Debugging
| Feature | Plugin | Keybind |
|---------|--------|---------|
| Debugger | nvim-dap + DAP UI | `<Space>db` / `dc` / `di` / `do` |
| Test runner | neotest (python, vitest, gtest, plenary) | `<Space>tr` / `tf` / `ta` |
| Task runner | overseer.nvim | `<Space>rr` / `rb` / `rt` |

### 🛠️ Integrations
| Feature | Plugin | Keybind |
|---------|--------|---------|
| File explorer | NvimTree | `<C-n>` |
| Integrated terminal | toggleterm.nvim | `<Space>tt` |
| Git gutter | gitsigns.nvim | `]c` / `[c` |
| Git commands | vim-fugitive | `<Space>gs` / `gc` / `gp` |
| Git graph | gitgraph.nvim | `<Space>gg` |
| GitHub PRs/Issues | octo.nvim | `<Space>gi` / `gpr` |
| Database | vim-dadbod + UI | `<Space>Du` |
| REST client | rest.nvim | `<Space>Rt` |
| Projects | project.nvim | `<Space>pp` |
| Sessions | persistence.nvim | `<Space>Ss` / `Sl` |
| Markdown preview | render-markdown.nvim | (automatic) |

### 🤖 AI
| Feature | Plugin | Keybind |
|---------|--------|---------|
| Code suggestions | GitHub Copilot | `<M-l>` accept |
| AI chat | CopilotChat.nvim | `<Space>ac` |

### 🎨 Visual
| Feature | Plugin | Keybind |
|---------|--------|---------|
| Theme | Tokyo Night | (4 styles: night/storm/moon/day) |
| Statusline | lualine.nvim | (git + diagnostics + breadcrumbs) |
| Dashboard | dashboard-nvim | (startup screen) |
| Zen mode | zen-mode.nvim | `<Space>zz` |
| Color highlight | nvim-colorizer.lua | (automatic) |
| Minimap | codewindow.nvim | `<Space>mm` |
| Smooth scroll | cinnamon.nvim | (automatic) |
| Indent guides | indent-blankline.nvim | (automatic) |
| Notifications | nvim-notify + noice.nvim | (toasts + LSP progress) |
| Screencast | screenkey.nvim | `<Space>kx` |

### ✏️ Editing
| Feature | Plugin | Keybind |
|---------|--------|---------|
| Multi-cursor | vim-visual-multi | `<Space>ma` |
| Comments | Comment.nvim | `gc` / `gb` |
| Auto pairs | nvim-autopairs | (automatic) |
| Surround | nvim-surround | `ys` / `cs` / `ds` |
| Refactoring | refactoring.nvim | `<Space>ca` |
| Undo tree | undotree | `<Space>u` |
| Match navigation | vim-matchup | `%` enhanced |

---

## 🚀 Installation

### Prerequisites

| Dependency | Purpose | Install (Fedora) |
|------------|---------|------------------|
| **Neovim** ≥ 0.10 | Core editor | `sudo dnf install neovim` |
| **Git** | Clone repo | `sudo dnf install git` |
| **Ripgrep** | Telescope search | `sudo dnf install ripgrep` |
| **Tar & Unzip** | Plugin builds | `sudo dnf install tar unzip` |

### Setup

```bash
# 1. Back up existing config
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}   # optional
mv ~/.local/state/nvim{,.bak}   # optional
mv ~/.cache/nvim{,.bak}         # optional

# 2. Clone the starter
git clone https://github.com/ae-orlando/nikavim-starter.git ~/.config/nvim

# 3. Remove the starter's git history
rm -rf ~/.config/nvim/.git

# 4. Launch Neovim
nvim
```

Lazy.nvim installs all plugins automatically on first launch. Wait for the `✨ NikaVim ready!` message.

### Install Language Servers

```vim
:Mason
```

Recommended first installs:
```bash
nvim --headless +MasonInstall\ lua_ls\ pyright\ ts_ls\ html\ cssls\ jsonls\ yamlls +qa
```

---

## 📁 Project Layout

```text
~/.config/nvim/
├── init.lua                 # Entry point (32 lines)
├── lazy-lock.json           # Plugin commit lock file
├── lua/
│   ├── core/
│   │   ├── init.lua         # Core loader
│   │   ├── options.lua      # Editor options
│   │   └── keymaps.lua      # Global keymaps
│   └── plugins/             # 30 feature modules
│       ├── init.lua         # Plugin registry
│       ├── ui.lua           # Theme, statusline, explorer, dashboard
│       ├── editing.lua      # Comments, pairs, surround, multi-cursor, etc.
│       ├── lsp.lua          # LSP, Mason, inlay hints, code lens, inc-rename
│       ├── treesitter.lua   # Syntax highlighting, text objects
│       ├── completion.lua   # nvim-cmp, LuaSnip, snippets
│       ├── telescope.lua    # Fuzzy finder
│       ├── formatting.lua   # conform + nvim-lint
│       ├── git.lua          # Gitsigns, fugitive, gitgraph
│       ├── whichkey.lua     # Keybinding discovery
│       ├── trouble.lua      # Diagnostics panel
│       ├── debug.lua        # DAP debugger
│       ├── test.lua         # Neotest runner
│       ├── markdown.lua     # In-buffer markdown render
│       ├── project.lua      # Project detection
│       ├── copilot.lua      # GitHub Copilot
│       ├── terminal.lua     # toggleterm
│       ├── ai.lua           # CopilotChat
│       ├── visuals.lua      # Zen mode, twilight, colorizer
│       ├── session.lua      # persistence.nvim
│       ├── navic.lua        # Breadcrumbs + navbuddy
│       ├── tasks.lua        # Overseer
│       ├── tools.lua        # Dadbod + rest.nvim
│       ├── minimap.lua      # codewindow.nvim
│       ├── screencast.lua   # screenkey.nvim
│       ├── octo.lua         # GitHub PRs/issues
│       ├── flash.lua        # Flash navigation
│       ├── todo.lua         # TODO/FIXME highlighting
│       ├── notify.lua       # nvim-notify + noice.nvim
│       └── harpoon.lua      # File bookmarks
├── README.md
├── KEYMAPS.md
├── QUICKSTART.md
├── SETUP.md
├── ADVANCED.md
├── CHANGELOG.md
├── INDEX.md
├── CONTRIBUTING.md
└── images/
```

---

## ⌨️ Essential Keymaps

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Search text |
| `<Space>fb` | Find buffers |
| `<Space>fr` | Recent files |
| `<Space>pp` | Switch projects |
| `<Space>tt` | Toggle terminal |
| `<Space>ac` | Toggle Copilot Chat |
| `<Space>zz` | Toggle Zen mode |
| `<Space>xx` | Toggle diagnostics panel |
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Continue debugger |
| `<Space>tr` | Run nearest test |
| `<Space>rr` | Run task |
| `<Space>gg` | Git commit graph |
| `<Space>gs` | Git status |
| `<Space>hh` | Harpoon quick menu |
| `<Space>ma` | Multi-cursor add word |
| `<Space>Ss` | Save session |
| `<Space>nb` | Code outline tree |
| `<Space>mm` | Toggle minimap |
| `<C-n>` | Toggle file explorer |
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Go to references |
| `s` | Flash jump to any character |
| `<F2>` | Rename symbol |
| `<F3>` | Format buffer |
| `<F4>` | Code actions |
| `<M-l>` | Accept Copilot suggestion |

> See [KEYMAPS.md](./KEYMAPS.md) for the **complete reference** (80+ keybindings).

---

## 🧰 Common Tasks

<details>
<summary><strong>Add a plugin</strong></summary>

```lua
-- Add to the most relevant file in lua/plugins/:
{
  "author/plugin.nvim",
  event = "BufReadPost",
  config = function()
    require("plugin").setup({})
  end,
}
```

Then run `:Lazy sync`.
</details>

<details>
<summary><strong>Add a keymap</strong></summary>

```lua
-- In lua/core/keymaps.lua:
local map = vim.keymap.set
map("n", "<leader>x", function()
  -- your action
end, { desc = "Describe the action" })
```
</details>

<details>
<summary><strong>Add a language server</strong></summary>

```vim
:Mason    " Search and install
```

Most servers auto-configure. For custom behaviour, edit `lua/plugins/lsp.lua`.
</details>

<details>
<summary><strong>Change the theme</strong></summary>

```lua
-- In lua/plugins/ui.lua
require("tokyonight").setup({ style = "storm" })
-- Options: night, storm, moon, day
```
</details>

---

## 🔍 Troubleshooting

| Problem | Try |
|---------|-----|
| Plugins missing | `:Lazy sync` |
| LSP not attached | `:LspInfo` + `:Mason` |
| Completion silent | Install the LSP server in Mason |
| Formatting not working | Install formatter in Mason; check `lua/plugins/formatting.lua` |
| Debugger not starting | Check `:DapInstall` and `lua/plugins/debug.lua` |
| Tests not running | Ensure test adapter is configured in `lua/plugins/test.lua` |
| Telescope slow | Run `:Telescope find_files` in a smaller directory |
| Terminal not opening | Check `lua/plugins/terminal.lua` config |
| Copilot Chat not responding | Ensure `copilot.vim` is authenticated (`:Copilot setup`) |
| Dashboard splits on `:Man` | Now fixed — auto-wipes on first new buffer |
| Startup feels slow | `:Lazy profile` or `nvim --startuptime startup.log` |

> See [ADVANCED.md](./ADVANCED.md) for deeper troubleshooting.

---

## 📚 Documentation

| File | Purpose |
|------|---------|
| [INDEX.md](./INDEX.md) | Documentation map |
| [QUICKSTART.md](./QUICKSTART.md) | Fastest path to a working editor |
| [SETUP.md](./SETUP.md) | Complete setup checklist |
| [KEYMAPS.md](./KEYMAPS.md) | Full keyboard reference (80+ bindings) |
| [ADVANCED.md](./ADVANCED.md) | Customization, performance, troubleshooting |
| [CHANGELOG.md](./CHANGELOG.md) | Version history |
| [CONTRIBUTING.md](./CONTRIBUTING.md) | Contribution guide |

---

## 📝 Notes

NikaVim is meant to be edited. The configuration is split into small files so you can remove features, swap plugins, or add your own workflow without digging through a monolithic `init.lua`. Every feature is a single file in `lua/plugins/` — disable what you don't need, customize what you use.
