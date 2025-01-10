local function vim_pasta()
	vim.g.pasta_disabled_filetypes = { "fugitive" }
end

return {
	-- Automatically fix indentation when pasting code.
	{
		"sickill/vim-pasta",
		config = vim_pasta,
	},
	-- Commenting support.
	{ "tpope/vim-commentary" },
	-- Allow plugins to enable repeating of commands.
	{ "tpope/vim-repeat" },
	-- Surround text objects with brackets, quotes, etc.
	{ "tpope/vim-surround" },
	-- Jump to the last location when opening a file.
	{ "farmergreg/vim-lastplace" },
	-- Automatically add closing brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
