local M = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		{ "williambowman/mason.nvim" },
		{ "folke/neoconf.nvim", cmd = "Neoconf" },
		{ "folke/neodev.nvim", opts = {} },
		{ "neovim/nvim-lspconfig", dependencies = { "folke/neoconf.nvim" } },
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	},
	init = function()
		vim.g.lsp_zero_extend_cmp = 0
		vim.g.lsp_zero_ui_float_border = 0
	end,
	--event = "UIEnter"
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("neoconf").setup({})

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
			clangd = function()
				require("lspconfig").clangd.setup({
					cmd = { "clangd", "--query-driver=/usr/bin/arm-none-eabi-*" },
				})
			end,
			lua_ls = function()
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
						},
					},
				})
			end,
			rust_analyzer = lsp_zero.noop,
			hls = lsp_zero.noop,
			jdtls = lsp_zero.noop,
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
			header = "",
		},
		virtual_text = {
			severity = {
				min = vim.diagnostic.severity.WARN,
			},
		},
	})
end

return M
