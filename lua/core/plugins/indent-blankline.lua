local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = {"BufReadPost", "BufNewFile"}
}

function M.config()
  require("ibl").setup({
    scope = {
      enabled = false,
      show_start = false,
      show_end = false
    }
  })
end

return M

