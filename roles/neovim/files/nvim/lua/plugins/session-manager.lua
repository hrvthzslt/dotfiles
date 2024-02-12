local function config()
	local session_manager_config = require("session_manager.config")
	require("session_manager").setup({
		autoload_mode = session_manager_config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
	})
end

return {
	"Shatur/neovim-session-manager",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = config,
}
