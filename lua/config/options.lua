-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local set = vim.opt
local fn = vim.fn
local api = vim.api

local utils = require("config.utils")

------------------------------------------------------------------------
--                          custom variables                          --
------------------------------------------------------------------------
vim.g.is_win = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac = utils.has("macunix") and true or false

vim.g.logging_level = "info"

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0 -- Disable perl provider
vim.g.loaded_ruby_provider = 0 -- Disable ruby provider
vim.g.loaded_node_provider = 0 -- Disable node provider
vim.g.did_install_default_menus = 1 -- do not load menu

if utils.executable("python3") then
  if vim.g.is_win then
    vim.g.python3_host_prog = fn.substitute(fn.exepath("python3"), ".exe$", "", "g")
  else
    vim.g.python3_host_prog = fn.exepath("python3")
  end
else
  api.nvim_err_writeln("Python3 executable not found! You must install Python3 and set its PATH correctly!")
  return
end

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = ","

---------------- vim options  ----------------

if vim.fn.has("macunix") then
  vim.opt.guifont = "UDEV Gothic NF:h12"
elseif vim.g.nvy == 1 then -- for nvy gui client
  set.guifont = "UDEV Gothic 35NFLG:h10:Consolas"
  -- can not use Sarasa Nerd Font in nvy GUI.
  -- vim.opt.guifont = "Sarasa Fixed CL Nerd Font SemiB:h12:Consolas"
elseif vim.fn.has("gui_running") then
  --vim.opt.guifont = "UDEV Gothic 35NFLG:h10:Consolas"
  set.guifont = "Sarasa Fixed CL Nerd Font SemiB:h10:Consolas"
else
  set.guifont = "Sarasa Fixed CL Nerd Font SemiB:h10:Consolas"
end

set.scrolloff = 10

-- Tabs/spaces
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.smartindent = true

-- Clipboard
set.clipboard = "unnamedplus"

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- lua/config/options.lua
vim.opt.termguicolors = true -- 启用真彩色支持
vim.opt.background = "dark" -- 设置深色/浅色背景

-- ,a:Cursor means in all modes hl group Cursor is applied
--vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor"
