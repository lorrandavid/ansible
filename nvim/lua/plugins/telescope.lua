return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      cmd = "Telescope",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<C-p>", "<cmd>Telescope git_files<cr>" },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>" },
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = {
  --     pickers = {
  --       find_files = {
  --
  --       }
  --     }
  --   }
  -- }
}
