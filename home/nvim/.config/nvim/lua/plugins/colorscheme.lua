local function config()
    vim.cmd([[
        set background=light
        colorscheme zenbones
    ]])
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    config = config
}
