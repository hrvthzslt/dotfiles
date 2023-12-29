local function config()
    vim.cmd([[
        let g:gruvbox_material_transparent_background=1
        let g:gruvbox_material_foreground='original'
        set background=light
        colorscheme gruvbox-material
    ]])
end

return {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = config
}
