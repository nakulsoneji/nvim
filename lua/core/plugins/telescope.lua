local M = {
  "nvim-telescope/telescope.nvim", tag = "0.1.2",
  -- or                              , branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  }
}

function M.config()
  require("telescope").setup()
  require("telescope").load_extension("file_browser")
end

return M
