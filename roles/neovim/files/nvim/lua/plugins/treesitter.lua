local function config()
	local ensure_installed = {
		"bash",
		"go",
		"perl",
		"python",
		"ruby",
		"c",
		"cpp",
		"dockerfile",
		"javascript",
		"typescript",
		"json",
		"html",
		"toml",
		"lua",
		"markdown",
		"php",
		"query",
		"sql",
		"vim",
		"vimdoc",
		"vue",
		"yaml",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
	}

	require("ts-install").setup({
		ensure_install = ensure_installed,
		-- Automatically install missing parsers when entering buffer
		auto_install = true,
	})

	vim.api.nvim_create_autocmd("FileType", {
		desc = "Enable Treesitter",
		group = vim.api.nvim_create_augroup("enable_treesitter", {}),
		-- Don't filter by `pattern`, install and enable Treesitter parsers for all languages.
		callback = function()
			-- Enable Treesitter syntax highlighting.
			if pcall(vim.treesitter.start) then
				-- Use Treesitter indentation and folds.
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end
		end,
	})

	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = config,
	},
	"nvim-treesitter/nvim-treesitter-context",
	"lewis6991/ts-install.nvim",
}
