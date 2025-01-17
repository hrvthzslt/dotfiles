local function config()
	vim.keymap.set("n", "<leader>d", ":DBUIToggle<CR>", { desc = "Database" })
end

return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		"tpope/vim-dadbod",
	},
	config = config,
}
