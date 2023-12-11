local telescope = require('telescope')

telescope.setup {
    defaults = {
        layout_strategy = 'horizontal', -- Set the layout strategy (horizontal, vertical, or flex)
        sorting_strategy = 'descending', -- or 'descending' for reverse order
        layout_config = {
            width = 0.999,                -- Adjust the width of the layout (as a percentage of the screen width)
            height = 0.999,               -- Adjust the height of the layout (as a percentage of the screen height)
            prompt_position = 'bottom',    -- Set the prompt position (top, bottom, or both)
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = { ".git/" }
        },
        current_buffer_tags = { show_line = false },
        jumplist = { show_line = false },
        loclist = { show_line = false },
        lsp_definitions = { show_line = false },
        lsp_document_symbols = { show_line = false },
        lsp_dynamic_workspace_symbols = { show_line = false },
        lsp_implementations = { show_line = false },
        lsp_incoming_calls = { show_line = false },
        lsp_outgoing_calls = { show_line = false },
        lsp_references = { show_line = false },
        lsp_type_definitions = { show_line = false },
        lsp_workspace_symbols = { show_line = false },
        quickfix = { show_line = false },
        tags = { show_line = false },
    }
}

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search Grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help tags" })
vim.keymap.set("n", "<leader>sl", builtin.resume, { desc = "Last Search" })
