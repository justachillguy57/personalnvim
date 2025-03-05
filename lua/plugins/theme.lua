return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			lualine = true,
			blink_cmp = true,
			custom_highlights = {
				LineNr = { fg = "#f38ba8" },
			},
		},
		lazy = true,
		event = { "VeryLazy" },
		priority = 600,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	-- line
	{
		"nvim-lualine/lualine.nvim",
		name = "lineluabro",
		lazy = true,
		event = "VeryLazy",
		priority = 550,
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
			})
		end,
	},
}
