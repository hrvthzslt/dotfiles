local function check_creds()
	local copilot_auth = require("copilot.auth")
	local filename = copilot_auth.find_config_path() .. "/github-copilot/apps.json"

	if vim.fn.filereadable(filename) == 0 then
		return
	end

    return 1
end

local function config()
	if not check_creds() then
        vim.keymap.set("n", "<leader>aa", ":echo 'Sign in to Copilot!'<CR>", { desc = "Avante Activate" })
		return
	end

	require("avante").setup({
		mode = "legacy",
		provider = "copilot",
		providers = {
			copilot = {
				-- model = "claude-3.7-sonnet",
				-- model = "gpt-4.1",
                model = "o4-mini",
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
		"stevearc/dressing.nvim",
	},
	config = config,
}
