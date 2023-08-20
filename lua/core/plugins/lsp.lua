local M = {
  "VonHeikemen/lsp-zero.nvim",
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {"neovim/nvim-lspconfig"},             -- Required
    {"williamboman/mason.nvim"},           -- Optional
    {"williamboman/mason-lspconfig.nvim"}, -- Optional
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
}

function M.config()
  local lsp = require('lsp-zero').preset({
    name = "recommended"
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

  lsp.setup()
end

return M
