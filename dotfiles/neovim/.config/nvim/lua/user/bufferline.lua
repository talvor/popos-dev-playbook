
local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

function M.config()
    require('bufferline').setup {
        options = {
            diagnostics = "nvim_lsp",
            separator_style = "slope",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true
                },
            },
            color_icons = true,
            get_element_icon = function(element)
              local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
              return icon, hl
            end,
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
        }
    }
end

return M
