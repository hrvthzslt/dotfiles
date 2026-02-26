local function config()
	require("nvim-treesitter-textobjects").setup({
		select = {
			lookahead = true,
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "V",
				["@class.outer"] = "<c-v>",
			},
			include_surrounding_whitespace = true,
		},
		move = {
			set_jumps = true,
		},
	})

	-- Select keymaps
	local select = require("nvim-treesitter-textobjects.select")

	vim.keymap.set({ "x", "o" }, "af", function()
		select.select_textobject("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "if", function()
		select.select_textobject("@function.inner", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "ac", function()
		select.select_textobject("@class.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "ic", function()
		select.select_textobject("@class.inner", "textobjects")
	end, { desc = "Select inner part of a class region" })
	vim.keymap.set({ "x", "o" }, "as", function()
		select.select_textobject("@scope", "locals")
	end, { desc = "Select language scope" })

	-- Move keymaps
	local move = require("nvim-treesitter-textobjects.move")

	vim.keymap.set({ "n", "x", "o" }, "]f", function()
		move.goto_next_start("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]c", function()
		move.goto_next_start("@class.outer", "textobjects")
	end, { desc = "Next class start" })
	vim.keymap.set({ "n", "x", "o" }, "]o", function()
		move.goto_next_start("@loop.*", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]s", function()
		move.goto_next_start("@scope", "locals")
	end, { desc = "Next scope" })
	vim.keymap.set({ "n", "x", "o" }, "]z", function()
		move.goto_next_start("@fold", "folds")
	end, { desc = "Next fold" })

	vim.keymap.set({ "n", "x", "o" }, "]F", function()
		move.goto_next_end("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "]C", function()
		move.goto_next_end("@class.outer", "textobjects")
	end)

	vim.keymap.set({ "n", "x", "o" }, "[f", function()
		move.goto_previous_start("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[c", function()
		move.goto_previous_start("@class.outer", "textobjects")
	end)

	vim.keymap.set({ "n", "x", "o" }, "[F", function()
		move.goto_previous_end("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[C", function()
		move.goto_previous_end("@class.outer", "textobjects")
	end)

	vim.keymap.set({ "n", "x", "o" }, "]d", function()
		move.goto_next("@conditional.outer", "textobjects")
	end)
	vim.keymap.set({ "n", "x", "o" }, "[d", function()
		move.goto_previous("@conditional.outer", "textobjects")
	end)
end

return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = config,
}
