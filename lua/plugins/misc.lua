return {
	"folke/which-key.nvim",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"laytan/cloak.nvim",
	{
		"folke/trouble.nvim",
		opts = {},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "v1.5.0", -- Make sure to update this to something recent!
    config = function()
      require("fidget").setup()
    end
	},
}
