local M = {
  "kdheepak/lazygit.nvim",
   -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register{
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
  }
end

return M
