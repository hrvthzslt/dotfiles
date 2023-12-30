local function config()
    vim.cmd([[
        let g:gruvbox_material_transparent_background=1
        let g:gruvbox_material_foreground='original'
        set background=light
        colorscheme zenbones
    ]])
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    priority = 1000,
    config = config
}
