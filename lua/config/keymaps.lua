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
wk.register({
  ["<C-h>"] = { "<C-w>h", "Window left" },
  ["<C-j>"] = { "<C-w>j", "Window down" },
  ["<C-k>"] = { "<C-w>k", "Window up" },
  ["<C-l>"] = { "<C-w>l", "Window right" },
  ["<C-w>"] = {
    name = "Window",
    ["h"] = { "<C-w>h", "Go left" },
    ["j"] = { "<C-w>j", "Go down" },
    ["k"] = { "<C-w>k", "Go up" },
    ["l"] = { "<C-w>l", "Go right" },
    ["="] = { "<C-w>=", "Equal width" },
    ["q"] = { "<C-w>q", "Close window" },
    ["s"] = { "<C-w>s", "Split horizontal" },
    ["v"] = { "<C-w>v", "Split vertical" },
  },
})
