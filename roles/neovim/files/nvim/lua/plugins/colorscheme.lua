local function config()
	-- vim.cmd("set background=light")
	vim.cmd("colorscheme zenbones")

	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		end,
	})
end

return {
	"mcchrish/zenbones.nvim",
	-- "hrvthzslt/gruvbox-material",
	dependencies = "rktjmp/lush.nvim",
	priority = 1000,
	config = config,
}
