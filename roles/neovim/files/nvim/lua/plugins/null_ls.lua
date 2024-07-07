local function setup(executable, sources_table, entry)
	if vim.fn.executable(executable) then
		table.insert(sources_table, entry)
	end
end

local function config()
	local null_ls = require("null-ls")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local sources = {}

	setup("stylua", sources, null_ls.builtins.formatting.stylua)
	setup("prettierd", sources, null_ls.builtins.formatting.prettierd)
	setup(
		"sql-formatter",
		sources,
		null_ls.builtins.formatting.sql_formatter.with({
			filetypes = { "sql", "mysql" },
		})
	)
	-- setup("isort", sources, null_ls.builtins.formatting.isort)
	setup("black", sources, null_ls.builtins.formatting.black)
	setup(
		"shfmt",
		sources,
		null_ls.builtins.formatting.shfmt.with({
			extra_args = { "-i", "2", "-ci" },
		})
	)
	setup(
		"php-cs-fixer",
		sources,
		null_ls.builtins.formatting.phpcsfixer.with({
			extra_args = { "--using-cache=no", "--config=.php-cs-fixer.php" },
		})
	)
	-- setup(
	-- 	"phpstan",
	-- 	sources,
	-- 	null_ls.builtins.diagnostics.phpstan.with({
	-- 		condition = function(utils)
	-- 			return utils.root_has_file({ "phpstan.neon" })
	-- 		end,
	-- 		extra_args = { "--memory-limit=1G" },
	-- 	})
	-- )

	null_ls.setup({
		capabilities = capabilities,
		debug = true,
		sources = sources,
	})

	require("mason").setup()
	require("mason-null-ls").setup({
		-- automatic_installation = true,
		-- ensure_installed = { "shellcheck" },
	})

	vim.keymap.set("n", "<leader>lN", "<cmd>:NullLsInfo<CR>", { desc = "Lsp NullLs" })
end

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = config,
}
