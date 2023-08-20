local M = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  require("nvim-tree").setup({
    diagnostics = {
      enable = true,
      icons = {
        error = " ",
        warning = " ",
        info = " ",
        hint = " "
      },
    },
  })
end

return M
