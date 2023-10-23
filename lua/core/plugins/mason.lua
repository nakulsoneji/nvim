local M = {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate"
}

function M.config()
  require("mason").setup()
end

return M

