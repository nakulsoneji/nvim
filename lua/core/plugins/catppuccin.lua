local M = {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha"
  })

  vim.cmd.colorscheme "catppuccin"
end

return M
