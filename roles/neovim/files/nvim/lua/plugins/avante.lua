local function config()
	require("avante").setup({
		mode = "legacy",
		provider = "copilot",
		providers = {
			copilot = {
				-- model = "claude-3.7-sonnet",
				model = "gpt-4.1",
			},
		},
		hints = { enabled = false },
	})
end

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this if you want to always pull the latest change
	opts = {
		-- add any opts here
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = config,
}
