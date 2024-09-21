return {
	{
		"RRethy/vim-illuminate",
		event = "BufEnter",
		config = function()
			require("illuminate").configure({
				under_cursor = true,
				filetypes_denylist = {
					"DressingSelect",
					"Outline",
					"TelescopePrompt",
					"alpha",
					"harpoon",
					"toggleterm",
					"neo-tree",
					"Spectre",
				},
			})
		end,
	},
}
