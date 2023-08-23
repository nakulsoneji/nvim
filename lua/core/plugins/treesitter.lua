local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true
    },
    autotag = {
      enable = true
    },
    indent = {
      enable = true,
      disable = {"html",},
    }

  })
end

return M
