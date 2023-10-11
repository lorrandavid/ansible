return {
  -- { "rose-pine/neovim", name = "rose-pine" },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        integrations = {
          alpha = true,
          cmp = true,
          flash = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          lsp_trouble = true,
          mason = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          noice = true,
          notify = true,
          neotree = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      })
    end,
  },
  -- { "savq/melange-nvim", name = "melange" },
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },
  -- { "morhetz/gruvbox" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "melange",
      -- colorscheme = "rose-pine",
      colorscheme = "catppuccin-macchiato",
      -- colorscheme = "gruvbox",
      -- colorscheme = "nordic",
    },
  },
}
