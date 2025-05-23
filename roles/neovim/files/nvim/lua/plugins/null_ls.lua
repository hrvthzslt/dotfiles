local function config()
	local null_ls = require("null-ls")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.sql_formatter.with({
			filetypes = { "sql", "mysql" },
		}),
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.djlint.with({
			filetypes = { "django", "jinja.html", "htmldjango", "html" },
		}),
		null_ls.builtins.diagnostics.djlint.with({
			filetypes = { "django", "jinja.html", "htmldjango", "html" },
		}),
		null_ls.builtins.formatting.shfmt.with({
			extra_args = { "-i", "2", "-ci" },
		}),
		null_ls.builtins.formatting.phpcsfixer.with({
			extra_args = { "--using-cache=no", "--config=.php-cs-fixer.php" },
		}),
		-- 	null_ls.builtins.diagnostics.phpstan.with({
		-- 		condition = function(utils)
		-- 			return utils.root_has_file({ "phpstan.neon" })
		-- 		end,
		-- 		extra_args = { "--memory-limit=1G" },
		-- 	})
	}

	null_ls.setup({
		capabilities = capabilities,
		debug = true,
		sources = sources,
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
