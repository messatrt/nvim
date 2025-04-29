-- Enable relative and absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Use spaces instead of tabs and set tab width
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Enable clipboard access (use system clipboard)
vim.opt.clipboard = "unnamedplus"

-- Map Ctrl-c to copy selected text to system clipboard in visual mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Useful other basic options
vim.opt.mouse = "a"          -- Enable mouse support
vim.opt.wrap = false         -- Disable line wrap
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.cursorline = true    -- Highlight current line
vim.opt.splitright = true    -- Vertical splits open to the right
vim.opt.splitbelow = true    -- Horizontal splits open below

-- Set leader key
require("config.lazy")
