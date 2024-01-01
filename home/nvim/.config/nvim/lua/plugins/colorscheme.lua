local function config()
    vim.cmd([[
        let g:gruvbox_material_transparent_background=1
        let g:gruvbox_material_foreground='original'
        let g:gruvbox_material_background = 'hard'
        set background=light
        colorscheme gruvbox-material
    ]])
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    -- "mcchrish/zenbones.nvim",
    "sainnhe/gruvbox-material",
    dependencies = "rktjmp/lush.nvim",
    priority = 1000,
    config = config
}
