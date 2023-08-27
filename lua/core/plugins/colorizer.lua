local M = {
  'NvChad/nvim-colorizer.lua'
}

function M.config()
  require("colorizer").setup({
    user_default_options = {
      css = true,
      always_update = true,
      tailwind = "both",
    }
  })
end

return M
