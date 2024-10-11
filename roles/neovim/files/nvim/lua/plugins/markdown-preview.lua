local function config()
	vim.keymap.set("n", "mm", ":MarkdownPreview<CR>", { desc = "Markdown preview" })
    vim.keymap.set("n", "ms", ":MarkdownPreviewStop<CR>", { desc = "Markdown Stop" })
end

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = config,
}
