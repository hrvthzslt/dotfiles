local function override_colors()
	vim.cmd([[
    hi link DapUINormal Normal
    hi link DapUIVariable Normal
    hi DapUIScope guifg=#1D5573
    hi DapUIType guifg=#7B3B70
    hi link DapUIValue Normal
    hi DapUIModifiedValue guifg=#1D5573 gui=bold
    hi DapUIDecoration guifg=#1D5573
    hi DapUIThread guifg=#3F5A22
    hi DapUIStoppedThread guifg=#1D5573
    hi link DapUIFrameName Normal
    hi DapUISource guifg=#7B3B70
    hi DapUILineNumber guifg=#1D5573
    hi link DapUIFloatNormal NormalFloat
    hi DapUIFloatBorder guifg=#1D5573
    hi DapUIWatchesEmpty guifg=#94253E
    hi DapUIWatchesValue guifg=#3F5A22
    hi DapUIWatchesError guifg=#94253E
    hi DapUIBreakpointsPath guifg=#1D5573
    hi DapUIBreakpointsInfo guifg=#3F5A22
    hi DapUIBreakpointsCurrentLine guifg=#3F5A22 gui=bold
    hi link DapUIBreakpointsLine DapUILineNumber
    hi DapUIBreakpointsDisabledLine guifg=#424242
    hi link DapUICurrentFrameName DapUIBreakpointsCurrentLine
    hi DapUIStepOver guifg=#1D5573
    hi DapUIStepInto guifg=#1D5573
    hi DapUIStepBack guifg=#1D5573
    hi DapUIStepOut guifg=#1D5573
    hi DapUIStop guifg=#94253E
    hi DapUIPlayPause guifg=#3F5A22
    hi DapUIRestart guifg=#3F5A22
    hi DapUIUnavailable guifg=#424242
    hi DapUIWinSelect ctermfg=Cyan guifg=#1D5573 gui=bold
    hi link DapUIEndofBuffer EndofBuffer
    ]])
end
local function go(dap)
	dap.adapters.delve = {
		type = "server",
		port = "${port}",
		executable = {
			command = "dlv",
			args = { "dap", "-l", "127.0.0.1:${port}" },
		},
	}

	-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
	dap.configurations.go = {
		{
			type = "delve",
			name = "Debug",
			request = "launch",
			program = "${file}",
		},
		{
			type = "delve",
			name = "Debug test", -- configuration for debugging test files
			request = "launch",
			mode = "test",
			program = "${file}",
		},
		-- works with go.mod packages and sub packages
		{
			type = "delve",
			name = "Debug test (go.mod)",
			request = "launch",
			mode = "test",
			program = "./${relativeFileDirname}",
		},
	}
end

local function php(dap)
	local function get_docker_workspace()
		local docker_compose_file = io.open("docker-compose.yml", "r")
		if docker_compose_file == nil then
			return "Unknown"
		end

		local composer_content = docker_compose_file:read("*a")
		docker_compose_file:close()

		local workdir = composer_content:match("working_dir: *([^\n]+)")
        if workdir == nil then
            return "Unknown"
        end

        return workdir
	end

	local docker_workspace = get_docker_workspace()

	dap.adapters.php = {
		type = "executable",
		command = "php-debug-adapter",
	}

	dap.configurations.php = {
		{
			name = docker_workspace .. ": Listen for Xdebug (Docker)",
			type = "php",
			request = "launch",
			port = 9000,
			-- log = true,
			pathMappings = {
				[docker_workspace] = "${workspaceFolder}",
			},
		},
		{
			name = "Listen for Xdebug",
			type = "php",
			request = "launch",
			port = 9003,
		},
	}
end

local function python(dap)
	require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
	local configurations = dap.configurations.python
	for _, configuration in pairs(configurations) do
		configuration.justMyCode = false
	end
end

local function config()
	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup({
		controls = {
			enabled = false,
		},
	})

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	go(dap)
	php(dap)
	python(dap)

	require("nvim-dap-virtual-text").setup()

	vim.keymap.set("n", "<leader>rt", function() dapui.toggle({ reset = true }) end, { desc = "Run debug Toggle ui" })
	vim.keymap.set("n", "<leader>rb", function() dap.toggle_breakpoint() end, { desc = "Run debug toggle Breakpoint" })
	vim.keymap.set("n", "<leader>rr", function() dap.continue() end, { desc = "Run debug Run" })
    vim.keymap.set("n", "<F1>", function() dap.continue() end, { desc = "Run debug continue" })
	vim.keymap.set("n", "<F3>", function() dap.step_into() end, { desc = "Run debug step into" })
	vim.keymap.set("n", "<F2>", function() dap.step_over() end, { desc = "Run debug step over" })
	vim.keymap.set("n", "<F4>", function() dap.step_out() end, { desc = "Run debug step out" })
    vim.keymap.set("n", "<F5>", function() dapui.toggle({ reset = true }) end, { desc = "Run debug toggle ui" })
	vim.keymap.set("n", "<leader>rT", function() dap.terminate() end, { desc = "Run debug terminate" })
    vim.keymap.set("n", "<leader>rf", function() dapui.float_element() end, { desc = "Run debug Float element" })
    vim.keymap.set("n", "<leader>re", function() dapui.eval() end, { desc = "Run debug Evaluate" })

	override_colors()
end

return {
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = config,
	},
	"theHamsta/nvim-dap-virtual-text",
}
