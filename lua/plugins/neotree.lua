return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{ "3rd/image.nvim", opts = {} },
	},

	config = function()
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Open Neotree" })
	end,
}
