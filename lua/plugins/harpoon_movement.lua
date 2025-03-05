return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
		end,
		lazy = true,
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
			},
			{
				"<C-e>",
				function()
					require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
				end,
			},
			{
				"<leader>ca",
				function()
					require("harpoon"):list():clear()
				end,
			},
		},
	},
}
