local function config()
    require("mason").setup()
    require('mason-lspconfig').setup({ automatic_installation = true })

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Lua
    local lua_ls = require('hrvthzslt.lsp.lua_ls')
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = lua_ls.settings
    }

    -- Bash
    lspconfig.bashls.setup {
        capabilities = capabilities
    }

    -- PHP
    local intelephense = require('hrvthzslt.lsp.intelephense')
    lspconfig.intelephense.setup {
        capabilities = capabilities,
        commands = intelephense.commands,
        settings = intelephense.settings
    }

    local phpactor = require('hrvthzslt.lsp.phpactor')
    lspconfig.phpactor.setup({
        capabilities = capabilities,
        on_attach = phpactor.on_attach,
        init_options = phpactor.init_options,
        handlers = phpactor.handlers
    })

    -- Python
    lspconfig.jedi_language_server.setup {
        capabilities = capabilities
    }

    -- Docker
    lspconfig.dockerls.setup {
        capabilities = capabilities
    }

    -- Vue, JavaScript, TypeScript
    local volar = require('hrvthzslt.lsp.volar')
    lspconfig.volar.setup({
        capabilities = capabilities,
        init_options = volar.init_options,
        on_attach = volar.on_attach,
        filetypes = volar.filetypes,
    })

    -- Go
    lspconfig.gopls.setup {
        capabilities = capabilities
    }

    -- Markdown
    lspconfig.marksman.setup {
        capabilities = capabilities,
    }

    -- Loader
    require("fidget").setup()

    -- Signs
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '󰋽 ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = ' ', texthl = 'DiagnosticSignHint' })

    -- Set keybindings on LSP
    local telescope_builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename' })
    vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, { desc = 'Lsp Code action' })
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Lsp Format' })
    vim.keymap.set('v', '<leader>lf', vim.lsp.buf.format, { desc = 'Lsp range Format' })
    vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'Lsp show Error' })
    vim.keymap.set('n', '<leader>ld', telescope_builtin.diagnostics, { desc = 'Lsp show Diagnostics' })
    vim.keymap.set("n", "<leader>ls", telescope_builtin.lsp_document_symbols, { desc = "Lsp document Symbols" })

    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next)

    vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, { desc = 'Go to Definition' })
    vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations, { desc = 'Go to Implementation' })
    vim.keymap.set('n', 'gt', telescope_builtin.lsp_type_definitions, { desc = 'Go to Type definitions' })
    vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, { desc = 'Go to Implementation' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

    vim.keymap.set('n', '<leader>lI', '<cmd>:LspInfo<CR>', { desc = 'Lsp Info' })
    vim.keymap.set('n', '<leader>lR', '<cmd>:LspRestart<CR>', { desc = 'Lsp Restart' })
    vim.keymap.set('n', '<leader>lM', '<cmd>:Mason<CR>', { desc = 'Lsp Mason' })
end

return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = config
    },
    'j-hui/fidget.nvim'
}
