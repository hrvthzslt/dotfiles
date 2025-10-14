local function config()
	require("neodev").setup()

	-- Lua
	local lua_ls = require("hrvthzslt.lsp.lua_ls")
	vim.lsp.enable("lua_ls")
	vim.lsp.config("lua_ls", {
		settings = lua_ls.settings,
		on_attach = lua_ls.on_attach,
	})

	-- Bash
	vim.lsp.enable("bashls")
	vim.lsp.config("bashls", {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	})

	-- PHP
	local intelephense = require("hrvthzslt.lsp.intelephense")
	vim.lsp.enable("intelephense")
	vim.lsp.config("intelephense", {
		commands = intelephense.commands,
		settings = intelephense.settings,
	})

	local phpactor = require("hrvthzslt.lsp.phpactor")
	vim.lsp.enable("phpactor")
	vim.lsp.config("phpactor", {
		on_attach = phpactor.on_attach,
		init_options = phpactor.init_options,
		handlers = phpactor.handlers,
	})

	-- Python
	vim.lsp.enable("ruff")
	vim.lsp.config("ruff", {
		handlers = {
			-- ["textDocument/publishDiagnostics"] = function() end,
		},
		on_attach = function(client)
			client.server_capabilities.hoverProvider = false
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	})
	vim.lsp.enable("pyright")
	vim.lsp.config("pyright", {
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
	})
	vim.lsp.enable("jinja_lsp")
	vim.lsp.config("jinja_lsp", {
		filetypes = { "jinja", "jinja.html", "htmldjango", "html" },
	})

	-- Docker
	vim.lsp.enable("dockerls")

	-- Javascript
	vim.lsp.enable("ts_ls")
	vim.lsp.enable("eslint")

	-- Go
	vim.lsp.enable("gopls")

	-- C
	vim.lsp.enable("clangd")

	-- Markdown
	vim.lsp.enable("marksman")

	-- Loader
	require("fidget").setup({})

	-- Diagnostics
	vim.diagnostic.config({
		virtual_text = true,
		-- virtual_lines = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.INFO] = "󰋽 ",
				[vim.diagnostic.severity.HINT] = " ",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
			},
		},
	})

	-- Set keybindings on LSP
	local telescope_builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
	vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Lsp Code action" })
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Lsp Format" })
	vim.keymap.set("v", "<leader>lf", vim.lsp.buf.format, { desc = "Lsp range Format" })
	vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Lsp show Error" })
	vim.keymap.set("n", "<leader>ld", telescope_builtin.diagnostics, { desc = "Lsp show Diagnostics" })
	vim.keymap.set("n", "<leader>ls", telescope_builtin.lsp_document_symbols, { desc = "Lsp document Symbols" })

	vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

	vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, { desc = "Go to Definition" })
	vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, { desc = "Go to Implementation" })
	vim.keymap.set("n", "gt", telescope_builtin.lsp_type_definitions, { desc = "Go to Type definitions" })
	vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { desc = "Go to Implementation" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

	vim.keymap.set("n", "<leader>lI", "<cmd>:LspInfo<CR>", { desc = "Lsp Info" })
	vim.keymap.set("n", "<leader>lR", "<cmd>:LspRestart<CR>", { desc = "Lsp Restart" })
	vim.keymap.set("n", "<leader>lM", "<cmd>:Mason<CR>", { desc = "Lsp Mason" })
end

return {
	{
		"neovim/nvim-lspconfig",
		config = config,
	},
	"j-hui/fidget.nvim",
	"folke/neodev.nvim",
}
