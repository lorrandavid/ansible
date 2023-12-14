return {
	{
		"dmmulroy/tsc.nvim",
		ft = { "typescript", "typescriptreact" },
		enabled = false,
		config = function()
			require("tsc").setup({
				pretty_errors = true,
			})
		end,
	},
}
