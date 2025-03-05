return (function()
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	local lspconfig = require("lspconfig")

	local capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

	local on_attach = function(client, bufnr)
		local opts = function(desc)
			return { noremap = true, silent = true, buffer = bufnr, desc = desc }
		end

		-- LSP Keymaps
		local keymaps = {
			{ "n", "gd", vim.lsp.buf.definition, "Go to Definition" },
			{ "n", "gD", vim.lsp.buf.declaration, "Go to Declaration" },
			{ "n", "gr", vim.lsp.buf.references, "Find References" },
			{ "n", "gi", vim.lsp.buf.implementation, "Go to Implementation" },
			{ "n", "gt", vim.lsp.buf.type_definition, "Go to Type Definition" },
			{ "n", "K", vim.lsp.buf.hover, "Hover Documentation" },
			{ "n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help" },
			{ "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
			{ "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
			{
				"n",
				"<leader>wl",
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				"List Workspace Folders",
			},
			{ "n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions" },
			{ "n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol" },
			{
				"n",
				"<leader>rf",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				"Format Code",
			},
			{ "n", "<leader>e", vim.diagnostic.open_float, "Show Diagnostic" },
			{ "n", "<leader>q", vim.diagnostic.setloclist, "Diagnostic Quickfix" },
			{ "n", "<leader>li", "<cmd>LspInfo<CR>", "LSP Info" },
		}

		-- Apply keymaps
		for _, map in ipairs(keymaps) do
			vim.keymap.set(map[1], map[2], map[3], opts(map[4]))
		end

		-- Toggle Inlay Hints (if supported)
		if client.server_capabilities.inlayHintProvider then
			vim.keymap.set("n", "<leader>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, opts("Toggle Inlay Hints"))
		end
	end

	-- Servers list
	local servers = {
		pyright = {},
		lua_ls = {},
		arduino_language_server = {},
	}

	-- Setup all servers automatically
	for server, config in pairs(servers) do
		lspconfig[server].setup(vim.tbl_deep_extend("force", {
			capabilities = capabilities,
			on_attach = on_attach,
		}, config))
	end
	vim.lsp.inlay_hint.enable(true)
	-- Global Diagnostics Config
	vim.diagnostic.config({ virtual_text = true })

	return {} -- File doesn't need to return anything useful, just executes on require
end)()
