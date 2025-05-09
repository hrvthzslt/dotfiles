local function config()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"bashls",
			"intelephense",
			"phpactor",
			"ruff",
			"pyright",
			"jinja_lsp",
			"dockerls",
			"ts_ls",
			"eslint",
			"gopls",
			"marksman",
		},
	})
	require("mason-null-ls").setup({
		ensure_installed = { "stylua", "prettierd", "sql-fomatter", "black", "djlint", "shfmt", "php-cs-fixer" },
	})
	require("mason-nvim-dap").setup({
		ensure_installed = { "delve", "php", "python" },
	})
end
return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = config,
}
