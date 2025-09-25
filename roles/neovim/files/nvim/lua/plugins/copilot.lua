local function config()
	require("copilot").setup({
		panel = {
			enabled = true,
		},
		suggestion = {
			enabled = true,
			auto_trigger = false,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				accept = "<C-h>",
				accept_word = false,
				accept_line = false,
				next = "<C-j>",
				prev = "<C-k>",
				dismiss = "<C-l>",
			},
		},
		filetypes = {
			yaml = true,
			markdown = true,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 18.x
		server_opts_overrides = {},
		copilot_model = "gpt-4.1",
	})

	vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot Status" })
	vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Copilot Panel" })
	vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot Enabe" })
	vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot Disable" })
end

return {
	{ "zbirenbaum/copilot.lua", config = config },
	{ "AndreM222/copilot-lualine" },
}
