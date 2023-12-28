local function splitjoin()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
end

local function vim_pasta()
    vim.g.pasta_disabled_filetypes = { "fugitive" }
end

return {
    {
        "AndrewRadev/splitjoin.vim",
        config = splitjoin,
    },
    {
        "tpope/vim-fugitive",
        config = vim_pasta,
    },
}
