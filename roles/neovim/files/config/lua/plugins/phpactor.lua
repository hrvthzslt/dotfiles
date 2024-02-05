local function config()
	vim.keymap.set("n", "<leader>lr", ":PhpactorContextMenu<CR>", { desc = "Lsp code Refactor" })
	vim.keymap.set("n", "<Leader>ln", ":PhpactorClassNew<CR>", { desc = "Lsp create New class" })
	vim.keymap.set("n", "<Leader>lt", ":PhpactorTransform<CR>", { desc = "Lsp Transform" })
end

return {
	"phpactor/phpactor",
	build = "composer install --no-dev --optimize-autoloader",
	ft = "php",
	config = config,
}
