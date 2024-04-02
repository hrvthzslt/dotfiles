-- Space is my leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set("v", "y", "myy`y")

-- Paste replace visual selection without copying it.
vim.keymap.set("v", "p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
-- vim.keymap.set('i', ';;', '<Esc>A;')
-- vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set("n", "<Leader>k", ":nohlsearch<CR>", { desc = "nohlsearch" })

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set("n", "<Leader>x", ":!xdg-open %<CR><CR>", { desc = "Xdg open" })

-- Source file
vim.keymap.set("n", "<Leader>S", ":so<CR>", { desc = "Source" })

-- Move lines up and down.
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Buffers
vim.keymap.set("n", "<leader><leader>", ":bp<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>o", ":wincmd o<CR>", { desc = "focus on window" })

-- Quickfix
vim.keymap.set("n", "<leader>n", ":cnext<CR>", { desc = "Next quick fix item" })
vim.keymap.set("n", "<leader>p", ":cprevious<CR>", { desc = "Previous quick fix item" })

-- Packer keymaps
-- vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", { desc = "Packer Sync" })
-- vim.keymap.set("n", "<leader>pc", ":PackerCompile<CR>", { desc = "Packer Compile" })

-- Navigation shortcuts
vim.keymap.set("n", "ú", "}")
vim.keymap.set("n", "ő", "{")
vim.keymap.set("n", "Ú", "]m")
vim.keymap.set("n", "Ő", "[m")

-- Registers
-- Mapping for "c" and "C"
vim.api.nvim_set_keymap("n", "c", '"cc', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"cc', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "C", '"cC', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "C", '"cC', { noremap = true, silent = true })

-- Mapping for "d" and "D"
vim.api.nvim_set_keymap("n", "d", '"dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "d", '"dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", '"dD', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "D", '"dD', { noremap = true, silent = true })

-- Mapping for "x" and "X"
vim.api.nvim_set_keymap("n", "x", '"xx', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "x", '"xx', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "X", '"xX', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "X", '"xX', { noremap = true, silent = true })

-- Mapping for "s" and "S"
vim.api.nvim_set_keymap("n", "s", '"ss', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "s", '"ss', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "S", '"sS', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "S", '"sS', { noremap = true, silent = true })
