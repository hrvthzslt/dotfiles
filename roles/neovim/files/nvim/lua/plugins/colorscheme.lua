local function config()
	-- vim.cmd("set background=light")
	vim.cmd("colorscheme zenbones")
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
	"mcchrish/zenbones.nvim",
	-- "hrvthzslt/gruvbox-material",
	dependencies = "rktjmp/lush.nvim",
	priority = 1000,
	config = config,
}
