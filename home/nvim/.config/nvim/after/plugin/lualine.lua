-- LSP clients attached to buffer
local clients_lsp = function()
    local bufnr = vim.api.nvim_get_current_buf()

    local clients = vim.lsp.buf_get_clients(bufnr)
    if next(clients) == nil then
        return ''
    end

    local c = {}
    for _, client in pairs(clients) do
        if client.name ~= 'copilot' then
            table.insert(c, string.sub(client.name, 1, 1))
        end
    end
    return '󰢾 ' .. table.concat(c, '')
end

local logo = function()
    local mode = vim.api.nvim_get_mode()["mode"]
    if mode == "i" then
        return " 󰏫 "
    elseif mode == "v" or mode == "V" then
        return " 󰈈 "
    else
        return "  "
    end
end

require("lualine").setup({
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
    },
    sections = {
        lualine_a = { logo },
        lualine_b = {
            -- "branch",
            "diff",
            -- Signal attached lsp
            -- '"󰢾 " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
            clients_lsp,
            "copilot",
            { "diagnostics", sources = { "nvim_diagnostic" } },
        },
        lualine_c = {
            {
                "filename",
                path = 1,
            }
        },
        lualine_x = { "filetype" },
        lualine_y = {
            "encoding",
            "fileformat",
            -- Signap tab type
            '(vim.bo.expandtab and "󱁐 " or "⇥ ") .. vim.bo.shiftwidth',
        },
        lualine_z = {
            "location",
            "progress",
        },
    },
})
