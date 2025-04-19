return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lsp_settings = {}

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pyright",
				},
				handlers = {
					function(server_name)
						local settings = lsp_settings[server_name]
						if settings then
							lspconfig[server_name].setup(vim.tbl_extend("force", {
								capabilities = capabilities,
							}, settings()))
						else
							lspconfig[server_name].setup({
								capabilities = capabilities,
							})
						end
					end,
				},
			})
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"lazy.nvim",
				-- It can also be a table with trigger words / mods
				-- Only load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
			-- always enable unless `vim.g.lazydev_enabled = false`
			-- This is the default
			enabled = function(root_dir)
				return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
			end,
		},
	},
	{
		"saghen/blink.cmp",
		event = { "LspAttach" },
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = {
				preset = "super-tab",
				["<C-d>"] = { "show_documentation", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
	config = function() end,
}
