local function set_hl()
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
end
local function config()
	require("illuminate").configure({
		-- delay: delay in milliseconds
		delay = 0,
		-- treesitter provider is broken with recent nvim-treesitter
		-- (locals module removed), use lsp and regex instead
		providers = { "lsp", "regex" },
	})

	set_hl()

	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			set_hl()
		end,
	})
end

return {
	"RRethy/vim-illuminate",
	config = config,
}
