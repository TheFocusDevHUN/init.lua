return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = true,
			float = {
				-- Padding around the floating window
				padding = 2,
				-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
				get_win_title = nil,
				-- preview_split: Split direction: "auto", "left", "right", "above", "below".
				preview_split = "auto",
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
		},
		config = function()
			local oil = require("oil")
			Remap("n", "e", oil.toggle_float)
			oil.setup()
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			Remap("n", "<leader>fd", builtin.find_files, { desc = "Telescope find files" })
			Remap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			Remap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			Remap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			local harpoon = require("harpoon")
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Hot files",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = false,
						sorter = conf.generic_sorter({}),
						layout_strategy = "center",
						layout_config = {
							preview_cutoff = 1, -- Preview should always show (unless previewer = false)

							width = function(_, max_columns, _)
								return math.min(max_columns, 90)
							end,

							height = function(_, _, max_lines)
								return math.min(max_lines, 20)
							end,
						},
					})
					:find()
			end

			Remap("n", "<C-e>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			Remap("n", "<leader>a", function()
				harpoon:list():add()
			end)

			Remap("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			Remap("n", "<C-a>", function()
				harpoon:list():select(1)
			end)
			Remap("n", "<C-s>", function()
				harpoon:list():select(2)
			end)
			Remap("n", "<C-d>", function()
				harpoon:list():select(3)
			end)
			Remap("n", "<C-f>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			Remap("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			Remap("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},
}
