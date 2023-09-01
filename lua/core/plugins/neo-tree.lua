local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  cmd = "Neotree",
}

function M.config()
  require("neo-tree").setup({
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        visible = true
      }
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          vim.cmd([[Neotree close]])
        end
      }
    }
  })
end

return M
