-- Set the leader key to <Space>
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>p", ":Ex<CR>", { desc = "Open file explorer (:Ex)" })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Clipboard settings
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Visual enhancements
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scrolling and splits
vim.opt.scrolloff = 10
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Undo and backup
vim.opt.undofile = true

-- Performance tuning
vim.opt.updatetime = 250

-- Increase timeout for leader key sequences
vim.opt.timeoutlen = 1000 -- 500ms to allow smoother key sequences

-- Display settings
--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = "split"

--Highligth on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Lazy set up
require("config.lazy")
vim.cmd("colorscheme rose-pine-moon")
