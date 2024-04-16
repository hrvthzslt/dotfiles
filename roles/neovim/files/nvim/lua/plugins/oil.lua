local function config()
	require("oil").setup({
		columns = {
			"icon",
			"permissions",
			-- "size",
			-- "mtime",
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
	})
	vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })
end

return {
	"stevearc/oil.nvim",
	config = config,
}
