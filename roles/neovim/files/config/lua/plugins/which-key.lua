local function config()
	vim.o.timeout = true
	vim.o.timeoutlen = 500
	require("which-key").setup({})
end

return {
	"folke/which-key.nvim",
	config = config,
}
