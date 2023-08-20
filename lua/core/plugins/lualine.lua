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
      component_separators = {
         left = "",
        right = "",
      },
      section_separators = {
        left = "",
        right = "",
      }
    }
  })
end

return M
