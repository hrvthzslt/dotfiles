local function config()
	vim.g.copilot_no_tab_map = true
	vim.g.copilot_assume_mapped = true
	vim.b.copilot_enabled = true
	vim.g.copilot_filetypes = {
		markdown = true,
		yaml = true,
	}

	vim.keymap.set("i", "<C-j>", "copilot#Next()", { expr = true, silent = true })
	vim.keymap.set("i", "<C-k>", "copilot#Previous()", { expr = true, silent = true })
	vim.api.nvim_set_keymap("i", "<C-h>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	vim.keymap.set("i", "<C-l>", "<Plug>(copilot-dismiss)")

	vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot Status" })
	vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Copilot Panel" })
	vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot Enabe" })
	vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot Disable" })
end

return {
	{ "github/copilot.vim", config = config },
}
