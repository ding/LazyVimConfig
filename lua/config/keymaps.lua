-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', 
--   silent = true,
--   noremap = true,  -- 避免递归映射
--   override = true  -- 强制覆盖其他映射
-- })
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', silent = true, noremap = true })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', silent = true, noremap = true })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to up window', silent = true, noremap = true })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to down window', silent = true, noremap = true })
local wk = require("which-key")

-- 添加到现有映射
wk.add({
  -- Window navigation
  { "<C-h>", "<C-w>h", desc = "Window left" },
  { "<C-j>", "<C-w>j", desc = "Window down" },
  { "<C-k>", "<C-w>k", desc = "Window up" },
  { "<C-l>", "<C-w>l", desc = "Window right" },

  -- Window management group
  { "<C-w>", group = "Window" },
  { "<C-w><C-h>", "<C-w>h", desc = "Go left" },
  { "<C-w><C-j>", "<C-w>j", desc = "Go down" },
  { "<C-w><C-k>", "<C-w>k", desc = "Go up" },
  { "<C-w><C-l>", "<C-w>l", desc = "Go right" },
  { "<C-w>=", "<C-w>=", desc = "Equal width" },
  { "<C-w>q", "<C-w>q", desc = "Close window" },
  { "<C-w>s", "<C-w>s", desc = "Split horizontal" },
  { "<C-w>v", "<C-w>v", desc = "Split vertical" },

  -- 如果你想添加 leader 键相关的映射
  { "<leader>", group = "+Leader" },
  { "<leader>w", group = "Windows" },
  { "<leader>wv", "<C-w>v", desc = "Split vertical" },
  { "<leader>ws", "<C-w>s", desc = "Split horizontal" },
  { "<leader>wq", "<C-w>q", desc = "Close window" },
  { "<leader>w=", "<C-w>=", desc = "Equal width" },
})
