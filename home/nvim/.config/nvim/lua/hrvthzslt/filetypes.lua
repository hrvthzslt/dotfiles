vim.filetype.add({
    -- Detect and assign filetype based on the extension of the filename
    extension = {},
    -- Detect and apply filetypes based on the entire filename
    filename = {
        [".env"] = "conf",
    },
    -- Detect and apply filetypes based on certain patterns of the filenames
    pattern = {
        -- INFO: Match filenames like - ".env.example", ".env.local" and so on
        ["%.env%.[%w_.-]+"] = "conf",
    },
})
