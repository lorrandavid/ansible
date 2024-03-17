return {
	{
		"lukas-reineke/indent-blankline.nvim",
		tag = "v2.20.8",
		event = "VeryLazy",
		dependencies = "tpope/vim-sleuth",
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = { "OverseerForm" },
			},
		},
	},
}
