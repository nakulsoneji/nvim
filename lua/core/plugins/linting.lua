local M = {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
		"rshkarin/mason-nvim-lint",
	},
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	require("lint").linters_by_ft = {
		--fill with any linters ex. lua = { "luacheck" },
		--lua = { "luacheck" },
	}

	--set this up last
	require("mason-nvim-lint").setup()

	vim.api.nvim_create_autocmd({ "InsertLeave", "BufReadPost", "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return M
