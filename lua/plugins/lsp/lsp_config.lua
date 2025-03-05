return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufRead", "BufNewFile" },
		name = "TreeSitter.",
		opts = {
			ensure_installed = { "python", "vimdoc", "regex", "lua", "markdown", "lua", "rust", "vim" },
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			auto_install = true,
			sync_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		name = "lsp.",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require("plugins.lsp.static_lsp")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
