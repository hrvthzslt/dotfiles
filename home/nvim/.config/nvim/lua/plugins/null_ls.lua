local function config()
    -- Null ls for formatting and linting
    local null_ls = require("null-ls")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    null_ls.setup({
        capabilities = capabilities,
        debug = true,
        sources = {
            null_ls.builtins.formatting.prettierd,
            null_ls.builtins.diagnostics.eslint_d.with({
              condition = function(utils)
                return utils.root_has_file({ '.eslintrc.js' })
              end,
            }),
            null_ls.builtins.formatting.sql_formatter.with({
                filetypes = { 'sql', 'mysql' },
            }),
            null_ls.builtins.formatting.autopep8,
            null_ls.builtins.formatting.phpcsfixer.with({
                extra_args = { "--using-cache=no", "--config=.php-cs-fixer.php" }
            }),
            null_ls.builtins.code_actions.shellcheck,
            null_ls.builtins.formatting.shfmt.with({
                extra_args = { "-i", "2", "-ci" }
            })
            -- null_ls.builtins.diagnostics.phpstan.with({
            --     extra_args = { "--memory-limit=1G" }
            -- })
        },
    })

    vim.keymap.set('n', '<leader>lN', '<cmd>:NullLsInfo<CR>', { desc = 'Lsp NullLs' })
end

return {
    'nvimtools/none-ls.nvim',
    config = config
}
