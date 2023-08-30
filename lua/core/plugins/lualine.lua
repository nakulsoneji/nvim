local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },
  },
}

function M.config()
  require("lualine").setup({
    options = {
      disabled_filetypes = {
        statusline = {
          "alpha"
        }
      },
      component_separators = {
         left = "│",
        right = "│",
      },
      section_separators = {
        left = "",
        right = "",
      },
      globalstatus = true,
    },
  })
end

return M
