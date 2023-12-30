local function go(dap)
    dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
            command = 'dlv',
            args = { 'dap', '-l', '127.0.0.1:${port}' },
        }
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}"
        },
        {
            type = "delve",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}"
        },
        -- works with go.mod packages and sub packages
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}"
        }
    }
end

local function php(dap)
    dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
    }

    dap.configurations.php = {
        {
            name = "Listen for Xdebug",
            type = "php",
            request = "launch",
            port = 9000,
            log = true
        }
    }
end

local function config()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup()

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

    require("nvim-dap-virtual-text").setup()

    vim.keymap.set('n', '<leader>bb', function() dap.toggle_breakpoint() end, { desc = 'deBug toggle Breakpoint' })

    vim.keymap.set('n', '<leader>bt', function() dapui.toggle({ reset = true }) end, { desc = 'deBug Toggle ui' })
    vim.keymap.set('n', '<leader>bb', function() dap.toggle_breakpoint() end, { desc = 'deBug toggle Breakpoint' })
    vim.keymap.set('n', '<leader>bc', function() dap.continue() end, { desc = 'deBug Continue' })
    vim.keymap.set('n', '<leader>bi', function() dap.step_into() end, { desc = 'deBug step Into' })
    vim.keymap.set('n', '<leader>bo', function() dap.step_over() end, { desc = 'deBug step Over' })
    vim.keymap.set('n', '<leader>bO', function() dap.step_out() end, { desc = 'deBug step Out' })
    vim.keymap.set('n', '<leader>bT', function() dap.terminate() end, { desc = 'deBug terminate' })
end

return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = config,
    },
    "theHamsta/nvim-dap-virtual-text"
}
