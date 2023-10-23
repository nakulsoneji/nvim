local M = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support 
    { "neovim/nvim-lspconfig" },
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    {
      "folke/neodev.nvim",
      opts = {
        library = {
          plugins = false
        },
      }
    },
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
	},
  init = function()
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_ui_float_border = 0
  end,
  --event = "UIEnter"
  event = {"BufReadPre", "BufNewFile"}
}

function M.config()
	local lsp_zero = require("lsp-zero")

	lsp_zero.on_attach(function(_, bufnr)
		-- see :help lsp-zero-keybindings
		-- to learn the available actions
		lsp_zero.default_keymaps({ bufnr = bufnr })
		local opts = { noremap = true, silent = true, buffer = true }
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<cr>", opts)
		vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
	end)

	require("mason-lspconfig").setup({
		automatic_installation = true,
    handlers = {
      lsp_zero.default_setup,
      rust_analyzer = lsp_zero.noop,
      hls = lsp_zero.noop
    }
	})

  require("lspconfig").lua_ls.setup({
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
      }
    },
  })

  --require("lspconfig").glslls.setup({})
  require("lspconfig").glsl_analyzer.setup({})

  vim.diagnostic.config({
    severity_sort = true,
    float = {
      border = "none",
      severity_sort = true,
      prefix = "",
      header = ""
    },
    virtual_text = {
      severity = {
        min = vim.diagnostic.severity.WARN
      }
    },
  })

end

return M
