return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',             -- Required
      'williamboman/mason.nvim',           -- Optional
      'williamboman/mason-lspconfig.nvim', -- Optional

      -- Autocompletion
      'hrsh7th/nvim-cmp',     -- Required
      'hrsh7th/cmp-nvim-lsp', -- Required
      -- 'hrsh7th/cmp-buffer',       -- Optional
      -- 'hrsh7th/cmp-path',         -- Optional
      -- 'saadparwaiz1/cmp_luasnip', -- Optional
      -- 'hrsh7th/cmp-nvim-lua',     -- Optional

      -- Install none-ls for diagnostics, code actions, and formating
      -- 'nvimtools/none-ls.nvim',

      -- Snippets
      'L3MON4D3/LuaSnip', -- Required
      -- 'rafamadriz/friendly-snippets', -- Optional
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local map_lsp_keybinds = require("user.keymaps_lsp").map_lsp_keybinds -- Has to load keymaps before plugins

      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        -- Pass the current buffer to map lsp keybinds
        map_lsp_keybinds(bufnr)
      end)

      -- Set diagnostic icons
      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
      })

      -- Setup mason so it can manage 3rd party LSP servers
      require('mason').setup({})

      -- LSP servers to install (see list here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers )
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  }
}
