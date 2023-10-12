return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      cmd = "Telescope",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
}
