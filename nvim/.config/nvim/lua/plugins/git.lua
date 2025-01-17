return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gstatus", "Gcommit", "Gpush" },
		keys = {
			{ "<leader>gs", ":Git<CR>", desc = "Git status" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
		keys = {
			{ "<leader>gd", ":DiffviewOpen<CR>", desc = "Open diff view" },
		},
		config = true,
	},
}
