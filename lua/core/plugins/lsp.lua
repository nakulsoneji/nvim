local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {"neovim/nvim-lspconfig"},             -- Required
    {"williamboman/mason.nvim"},           -- Optional
    {"williamboman/mason-lspconfig.nvim"}, -- Optional
  },
}

function M.config()
  local lsp = require('lsp-zero').preset({
    name = "lsp-only"
  })
  lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
  end)

  require("mason-lspconfig").setup {
    automatic_installation = true,
  }
  -- (Optional) Configure lua language server for neovim
  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  lsp.skip_server_setup({'rust_analyzer'})

end

return M
