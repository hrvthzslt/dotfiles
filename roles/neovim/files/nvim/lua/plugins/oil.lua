local function config()
	require("oil").setup({
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
		keymaps = {
			["<C-h>"] = false,
			["<M-h>"] = "actions.select_split",
			["<C-l>"] = false,
		},
	})
	vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })
end

return {
	"stevearc/oil.nvim",
	config = config,
}
