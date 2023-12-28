local function config()
    vim.keymap.set("n", "<leader>u", function()
        vim.cmd.UndotreeToggle()
        vim.cmd.UndotreeFocus()
    end, { desc = "Undo tree " })
end

return {
    'mbbill/undotree',
    config = config,
}
