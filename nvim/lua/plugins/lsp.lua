return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig", -- Required
			"williamboman/mason.nvim", -- Optional
			"williamboman/mason-lspconfig.nvim", -- Optional

			-- Autocompletion
			"hrsh7th/nvim-cmp", -- Required
			"hrsh7th/cmp-nvim-lsp", -- Required

			-- Autotag/Autopairs
			"windwp/nvim-ts-autotag",
			"windwp/nvim-autopairs",
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local map_lsp_keybinds = require("user.keymaps_lsp").map_lsp_keybinds -- Has to load keymaps before plugins
			local cmp = require("cmp")

			require("nvim-autopairs").setup()

			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })

				-- Pass the current buffer to map lsp keybinds
				map_lsp_keybinds(bufnr)
			end)

			-- Set diagnostic icons
			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})

			-- Setup mason so it can manage 3rd party LSP servers
			require("mason").setup({})

			-- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
			require("mason-lspconfig").setup({
				ensure_installed = { "tsserver" },
				handlers = {
					lsp_zero.default_setup,
				},
			})

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- Cmp window border
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},
}
