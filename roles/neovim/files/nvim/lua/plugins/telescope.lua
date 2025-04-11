local function config()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				width = 0.8, -- Adjust the width of the layout (as a percentage of the screen width)
				height = 0.8, -- Adjust the height of the layout (as a percentage of the screen height)
				prompt_position = "top", -- Set the prompt position (top, bottom, or both)
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				no_ignore = true,
				file_ignore_patterns = { ".git/" },
			},
			live_grep = {
				file_ignore_patterns = { ".git/" },
				additional_args = function(_)
					return {
						"--hidden",
						"--no-ignore",
						"--smart-case",
					}
				end,
			},
			current_buffer_tags = { show_line = false },
			jumplist = { show_line = false },
			loclist = { show_line = false },
			lsp_definitions = { show_line = false },
			lsp_document_symbols = { show_line = false },
			lsp_dynamic_workspace_symbols = { show_line = false },
			lsp_implementations = { show_line = false },
			lsp_incoming_calls = { show_line = false },
			lsp_outgoing_calls = { show_line = false },
			lsp_references = { show_line = false },
			lsp_type_definitions = { show_line = false },
			lsp_workspace_symbols = { show_line = false },
			quickfix = { show_line = false },
			tags = { show_line = false },
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({
					layout_config = {
						width = 0.4, -- Adjust the width of the layout (as a percentage of the screen width)
						height = 0.4, -- Adjust the height of the layout (as a percentage of the screen height)
						prompt_position = "bottom", -- Set the prompt position (top, bottom, or both)
					},
				}),
			},
		},
	})

	require("dir-telescope").setup({
		hidden = false,
		no_ignore = false,
		show_preview = true,
	})

	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")
	telescope.load_extension("dir")

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
	vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search Grep" })
	vim.keymap.set("n", "<leader>sd", "<cmd>Telescope dir live_grep<CR>", { desc = "Search grep in Dir" })
	vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search Buffers" })
	vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help tags" })
	vim.keymap.set("n", "<leader>sl", builtin.resume, { desc = "Last Search" })
	vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = config,
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "princejoogie/dir-telescope.nvim" },
}
