return {
	"mfussenegger/nvim-lint",
	lazy = false,
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luac" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()

				-- run specific linters, independent of the `linters_by_ft` configuration
			end,
		})
	end,
}
