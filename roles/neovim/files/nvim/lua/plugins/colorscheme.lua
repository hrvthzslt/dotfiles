local function set_hl()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

local function config()
	vim.cmd("colorscheme zenbones")
	set_hl()

	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		callback = function()
			set_hl()
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
