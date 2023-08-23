local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        Pmenu = {bg = colors.base},
        NormalFloat = {bg = colors.base},
        FloatBorder = {fg = colors.text}
      }
    end,
  })

  vim.cmd.colorscheme "catppuccin"
end

--[[local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  require("tokyonight").setup({
    style="night",
  })
  vim.cmd.colorscheme "tokyonight"
end
]]--

return M
