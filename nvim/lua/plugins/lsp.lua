return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',             -- Required
      'williamboman/mason.nvim',           -- Optional
      'williamboman/mason-lspconfig.nvim', -- Optional

      -- Autocompletion
      'hrsh7th/nvim-cmp',         -- Required
      'hrsh7th/cmp-nvim-lsp',     -- Required
      'hrsh7th/cmp-buffer',       -- Optional
      'hrsh7th/cmp-path',         -- Optional
      'saadparwaiz1/cmp_luasnip', -- Optional
      'hrsh7th/cmp-nvim-lua',     -- Optional

      -- Install none-ls for diagnostics, code actions, and formating
      -- "jose-elias-alvarez/null-ls.nvim",

      -- Snippets
      'L3MON4D3/LuaSnip',             -- Required
      'rafamadriz/friendly-snippets', -- Optional
    },
    config = function()
      local lsp = require("lsp-zero")

      -- Setup lsp-zero with recommended settings
      lsp.preset("recommended")
      lsp.on_attach(function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
      end)
      lsp.nvim_workspace()
      lsp.setup()
      vim.diagnostic.config { virtual_text = true }

      -- Setup mason so it can manage 3rd party LSP servers
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })

      -- Configure mason to auto install servers
      require('mason-lspconfig').setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        ensure_installed = { 'tsserver' },
        handlers = {
          lsp.default_setup,
        },
      })
    end
  }
}
