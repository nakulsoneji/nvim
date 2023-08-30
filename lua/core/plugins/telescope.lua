local M = {
  "nvim-telescope/telescope.nvim", tag = "0.1.2",
  -- or                              , branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  }
}

function M.config()
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      sorting_strategy = "ascending",
      path_display = { "truncate" },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = { prompt_position = "top" },
      },
      prompt_prefix = "   ",
      selection_caret = "❯ "
    }
  })

  telescope.load_extension("file_browser")
end

return M
