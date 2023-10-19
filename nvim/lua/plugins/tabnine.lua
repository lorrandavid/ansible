local utils = require("user.utils")

return {
  -- Tabnine cmp source
  {
    "nvim-cmp",
    dependencies = {
      -- Add TabNine support, make sure you run :CmpTabnineHub after installation.
      {
        "tzachar/cmp-tabnine",
        build = utils.is_win() and "pwsh -noni .\\install.ps1" or "./install.sh",
        dependencies = "hrsh7th/nvim-cmp",
        opts = {
          max_lines = 1000,
          max_num_results = 3,
          sort = true,
        },
        config = function(_, opts)
          require("cmp_tabnine.config"):setup(opts)
        end,
      },
    },
  },
}
