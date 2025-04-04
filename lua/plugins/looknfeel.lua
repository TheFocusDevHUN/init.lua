return {
	-- Colorscheme
	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		priority = 999969,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme mellow]])
		end,
	},
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		priority = 999968,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.opt.showmode = false
			require("lualine").setup()
		end,
	},
}
