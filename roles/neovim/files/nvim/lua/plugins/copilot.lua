local function old_config()
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

-- return {
-- 	{ "github/copilot.vim", config = config },
-- }

local function config()
	require("copilot").setup({
		panel = {
			enabled = false,
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
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
