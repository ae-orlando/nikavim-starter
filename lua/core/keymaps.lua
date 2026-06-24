-- ~/.config/nvim/lua/core/keymaps.lua
-- All keyboard mappings

local map = vim.keymap.set

-- Leader key (Space)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================
-- Basic Editing
-- ============================================
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":qa<CR>", { desc = "Quit all" })
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- ============================================
-- Window Navigation
-- ============================================
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })

-- ============================================
-- Resize Splits
-- ============================================
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- ============================================
-- Move Lines (Visual Mode)
-- ============================================
map("v", "J", ":m '>+1<CR>gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv", { desc = "Move line up" })

-- ============================================
-- Search and Center
-- ============================================
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- ============================================
-- Buffer Navigation
-- ============================================
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- ============================================
-- File Explorer
-- ============================================
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- ============================================
-- Telescope / Fuzzy Finding
-- ============================================
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })
map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Help tags" })
map("n", "<leader>fr", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Recent files" })
map("n", "<leader>fc", function()
  require("telescope.builtin").commands()
end, { desc = "Commands" })

-- ============================================
-- LSP Keymaps (also set in lsp.lua on attach)
-- ============================================
-- These are duplicated here as fallbacks
-- Real keymaps are set in lua/plugins/lsp.lua on LspAttach

-- ============================================
-- Code Actions and Refactoring
-- ============================================
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- ============================================
-- Plugin Management
-- ============================================
map("n", "<leader>l", ":Lazy<CR>", { desc = "Lazy plugin manager" })
map("n", "<leader>m", ":Mason<CR>", { desc = "Mason package manager" })

-- ============================================
-- Terminal (now managed by toggleterm.nvim)
-- See lua/plugins/terminal.lua
-- ============================================
-- Legacy mapping removed; use <leader>tt / <C-\\> instead
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ============================================
-- Better visuals for redo/undo
-- ============================================
map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle undo tree" })

-- =============================================
-- Moving to lines easilu
-- =============================================
-- Insert new line below like VS Code (Ctrl + Enter)
-- Works in both Normal mode and Insert mode
vim.keymap.set("n", "<C-Enter>", "o<Esc>", { desc = "Insert newline below" })
vim.keymap.set("i", "<C-Enter>", "<Esc>o", { desc = "Insert newline below" })