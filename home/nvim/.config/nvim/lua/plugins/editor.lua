local function splitjoin()
	vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
	vim.g.splitjoin_trailing_comma = 1
	vim.g.splitjoin_php_method_chain_full = 1
end

local function vim_pasta()
	vim.g.pasta_disabled_filetypes = { "fugitive" }
end

return {
	-- Split arrays and methods onto multiple lines, or join them back up.
	{
		"AndrewRadev/splitjoin.vim",
		config = splitjoin,
	},
	-- Automatically fix indentation when pasting code.
	{
		"sickill/vim-pasta",
		config = vim_pasta,
	},
	-- Commenting support.
	{ "tpope/vim-commentary" },
	-- Useful commands like :Rename and :SudoWrite.
	{ "tpope/vim-eunuch" },
	-- Allow plugins to enable repeating of commands.
	{ "tpope/vim-repeat" },
	-- Jump to the last location when opening a file.
	{ "farmergreg/vim-lastplace" },
	-- Enable * searching with visually selected text.
	{ "nelstrom/vim-visual-star-search" },
	-- Automatically create parent dirs when saving.
	{ "jessarcher/vim-heritage" },
	-- Automatically add closing brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
}
