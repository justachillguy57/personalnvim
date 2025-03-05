return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", { "nvim-tree/nvim-web-devicons", opts = {}, lazy = true } },
		lazy = true,
		keys = {
			{
				"<leader>f",
				"<cmd>Telescope find_files<cr>",
			},
			{
				"<leader>g",
				"<cmd>Telescope live_grep<cr>",
			},
			{
				"<leader>gf",
				"<cmd>Telescope git_files<cr>",
			},
			{
				"<leader>b",
				"<cmd>Telescope buffers<cr>",
			},
		},
		opts = {
			defaults = {
				prompt_prefix = "❯ ",
				selection_caret = "❯ ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
			},
		},
	},
}
