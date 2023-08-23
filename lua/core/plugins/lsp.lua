local M = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support 
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},
	},
}

function M.config()
	local lsp = require("lsp-zero").preset({
		name = "lsp-only",
	})

	lsp.on_attach(function(_, bufnr)
		-- see :help lsp-zero-keybindings
		-- to learn the available actions
		lsp.default_keymaps({ bufnr = bufnr })
		local opts = { noremap = true, silent = true, buffer = true }
		vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
		vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<cr>", opts)
		vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", opts)
		vim.keymap.set("i", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
	end)

	require("mason-lspconfig").setup({
		automatic_installation = true,
	})
	-- (Optional) Configure lua language server for neovim
	require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

	lsp.skip_server_setup({ "rust_analyzer" })


	lsp.setup()
end

return M
