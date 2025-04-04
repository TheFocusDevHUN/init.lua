return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			remap("n", "<leader>fd", builtin.find_files, { desc = "Telescope find files" })
			remap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			remap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			remap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

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

			remap("n", "<C-e>", function()
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

			remap("n", "<leader>a", function()
				harpoon:list():add()
			end)

			remap("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			remap("n", "<C-a>", function()
				harpoon:list():select(1)
			end)
			remap("n", "<C-s>", function()
				harpoon:list():select(2)
			end)
			remap("n", "<C-d>", function()
				harpoon:list():select(3)
			end)
			remap("n", "<C-f>", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			remap("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)
			remap("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
		end,
	},
}
