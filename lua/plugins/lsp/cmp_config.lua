return {
	"saghen/blink.cmp",
	profile = true,
	event = "LspAttach",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "rust" },
		completion = {
			menu = { border = "single", scrollbar = false },
			documentation = {
				window = { border = "single", scrollbar = false },
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
		signature = {
			enabled = true,
			trigger = { enabled = true },
			window = {
				scrollbar = false,
				border = "single",
			},
		},
	},
	opts_extend = { "sources.default" },
}
