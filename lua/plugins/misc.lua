return {
  "lewis6991/gitsigns.nvim",
	"folke/which-key.nvim",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"laytan/cloak.nvim",
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = true,
	},
	{
		"echasnovski/mini.move",
		version = "*",
		config = true,
	},
	{
		"echasnovski/mini.comment",
		version = "*",
		config = true,
	},
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
		config = true,
	},
}
