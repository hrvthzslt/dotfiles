vim.keymap.set("n", "<leader>d", ":DBUIToggle<CR>", { desc = "Database" })

local function db_completion()
    require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "sql",
    },
    command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "sql",
        "mysql",
        "plsql",
    },
    callback = function()
        vim.schedule(db_completion)
    end,
})
