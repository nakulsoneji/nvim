local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
      enable = true
    },
    additional_vim_regex_highlighting = false,
  })
end

return M
