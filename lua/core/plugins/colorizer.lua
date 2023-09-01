local M = {
  'NvChad/nvim-colorizer.lua',
  event = {"BufReadPre", "BufNewFile"}
}

function M.config()
  require("colorizer").setup({
    user_default_options = {
      css = true,
      always_update = true,
      tailwind = true,
    }
  })
end

return M
