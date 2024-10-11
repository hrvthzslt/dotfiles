local function config()
	vim.g.mkdp_refresh_slow = 1
	vim.g.mkdp_theme = "light"
	vim.g.mkdp_filetypes = { "markdown" }

	vim.keymap.set("n", "mm", ":MarkdownPreview<CR>", { desc = "Markdown preview" })
	vim.keymap.set("n", "ms", ":MarkdownPreviewStop<CR>", { desc = "Markdown Stop" })
end

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	ft = { "markdown" },
	config = config,
}
