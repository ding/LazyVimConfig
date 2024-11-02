-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local set = vim.opt
---------------- vim options  ----------------

if vim.fn.has("macunix") then
else
  if vim.g.nvy == 1 then -- for nvy gui client
    set.guifont = "UDEV Gothic 35NFLG:h12:Consolas"
    -- can not use Sarasa Nerd Font in nvy GUI.
    -- vim.opt.guifont = "Sarasa Fixed CL Nerd Font SemiB:h12:Consolas"
  elseif vim.fn.has("gui_running") then
    --vim.opt.guifont = "UDEV Gothic 35NFLG:h10:Consolas"
    set.guifont = "Sarasa Fixed CL Nerd Font SemiB:h10:Consolas"
  end
end

-- Change leader key
vim.g.mapleader = ","

set.scrolloff = 10

-- Tabs/spaces
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.smartindent = true
-- Clipboard
set.clipboard = "unnamedplus"

-- ,a:Cursor means in all modes hl group Cursor is applied
--vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor"
