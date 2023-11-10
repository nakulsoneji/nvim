local M = {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	lazy = true,
	cmd = "ConformInfo",
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			--cpp = { "clang_format" },
			--c = { "clang_format" },
		},
	})
end

return M
