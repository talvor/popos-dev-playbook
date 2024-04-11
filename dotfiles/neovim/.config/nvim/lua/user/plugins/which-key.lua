return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
    local wk = require "which-key"

    wk.register({
      s = {
        name = "Split",
      },

      t = {
        name = "Tab",
      },
    }, { prefix = "<leader>" })
  end,
}
