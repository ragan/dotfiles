return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "Gstatus", "Gcommit", "Gpush" },
		keys = {
			{ "<leader>gs", ":Git<CR>", desc = "Git status" },
		},
	},
}
