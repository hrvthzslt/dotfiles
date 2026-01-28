-- Space is my leader.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffers
vim.keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<Leader>Q", ":%bd<CR>", { desc = "close all buffers" })
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "write buffer" })
vim.keymap.set("n", "<Leader>W", ":wa<CR>", { desc = "write all buffers" })

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

-- Quickly clear search highlighting.
vim.keymap.set("n", "<Leader>k", ":nohlsearch<CR>", { desc = "nohlsearch" })

-- Exit terminal mode.
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

-- Copy file path
vim.keymap.set("n", "<Leader>C", ":! echo % | xsel -ib<CR><CR>", { desc = "Copy file path" })

-- Move lines up and down.
vim.keymap.set("i", "<A-n>", "<Esc>:move .+1<CR>==gi")
vim.keymap.set("i", "<A-p>", "<Esc>:move .-2<CR>==gi")
vim.keymap.set("n", "<A-n>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-p>", ":move .-2<CR>==")
vim.keymap.set("v", "<A-n>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-p>", ":move '<-2<CR>gv=gv")

-- Quickfix
vim.keymap.set("n", "<leader>n", ":cnext<CR>", { desc = "Next quick fix item" })
vim.keymap.set("n", "<leader>p", ":cprevious<CR>", { desc = "Previous quick fix item" })

-- Execute lua
vim.keymap.set("n", "<leader>x", ":.lua <CR>", { desc = "eXecute lua" })
vim.keymap.set("v", "<leader>x", ":lua <CR>", { desc = "eXecute lua" })

-- Diff
vim.keymap.set("n", "<leader>ff", ":windo diffthis <CR>", { desc = "diFF visible windows" })
vim.keymap.set("n", "<leader>fo", ":windo diffoff <CR>", { desc = "turn diFf Off" })

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
