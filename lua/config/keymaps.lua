-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>gd", "<cmd> cd %:p:h <CR> <cmd> pwd <CR>", { desc = "jump to current dir to pwd" })
map("n", ";", ":", { desc = "command mode" })
map("i", "<C-k>", "<up>", { desc = "up" })
map("i", "<C-j>", "<down>", { desc = "down" })
map("i", "<C-h>", "<left>", { desc = "left" })
map("i", "<C-l>", "<right>", { desc = "right" })
