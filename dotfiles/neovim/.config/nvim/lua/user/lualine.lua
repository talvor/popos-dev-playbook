local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "nord",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        -- winbar = {},
      },
      ignore_focus = { "NvimTree" },
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    winbar = {
      lualine_a = {
        function()
          return "     "
        end,
      },
      lualine_c = {
        {
          "navic",
          color_correction = nil,
          navic_opts = nil,
        },
      },
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
