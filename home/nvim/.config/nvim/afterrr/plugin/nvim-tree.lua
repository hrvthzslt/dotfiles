require("nvim-tree").setup({
    git = {
        ignore = false,
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
})

vim.keymap.set("n", "<Leader>f", ":NvimTreeFindFileToggle<CR>", { desc = "Find in file tree" })
vim.keymap.set("n", "<Leader>F", ":NvimTreeToggle<CR>", { desc = "explore File tree" })
