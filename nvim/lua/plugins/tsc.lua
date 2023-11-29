return {
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact" },
    config = function()
      require("tsc").setup({
        pretty_errors = true,
      })
    end,
  },
}
