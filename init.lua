-- ~/.config/nvim/init.lua
-- NikaVim — thin bootstrap
--
-- In development mode, this file finds the sibling nika-source/ directory
-- and inherits all plugin configs via runtimepath (single source of truth).
-- When no sibling is found (production / end-user), it falls back to its
-- own lua/ directory (populated by sync.sh during release builds).

-- ──────────────────────────────────────────────
-- 1. Resolve paths relative to this file
-- ──────────────────────────────────────────────
local src = debug.getinfo(1, "S").source               -- "@" prefix
if src:sub(1, 1) == "@" then
  src = src:sub(2)
end
local this_dir = vim.fn.fnamemodify(src, ":p:h")        -- dir of init.lua

-- ──────────────────────────────────────────────
-- 2. Inheritance — sibling nika-source (dev mode)
-- ──────────────────────────────────────────────
local nika_source = vim.fn.fnamemodify(this_dir .. "/../nika-source", ":p")
if vim.fn.isdirectory(nika_source) == 1 then
  vim.opt.rtp:prepend(nika_source)
end

-- ──────────────────────────────────────────────
-- 3. Bootstrap lazy.nvim
-- ──────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ──────────────────────────────────────────────
-- 4. Load core options & keymaps
-- ──────────────────────────────────────────────
require("core")

-- ──────────────────────────────────────────────
-- 5. Load all plugins
-- ──────────────────────────────────────────────
require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = true,
  },
})

-- ──────────────────────────────────────────────
-- 6. Ready indicator
-- ──────────────────────────────────────────────
vim.schedule(function()
  print("✨ NikaVim ready!")
end)
