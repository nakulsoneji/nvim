local M = {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons'     -- optional
  }
}

function M.config()
  require("lspsaga").setup({
    lightbulb = {
      enable = false
    },
    diagnostic = {
      show_code_action = false,
      border_follow = false,
    },
    hover = {
      open_link = 'ff',
      open_cmd = '!firefox'
    }
  })
end

return M
