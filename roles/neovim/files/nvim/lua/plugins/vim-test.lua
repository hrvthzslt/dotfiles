local function config()
	vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>", { desc = "Test Nearest" })
	vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>", { desc = "Test File" })
	vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>", { desc = "Test Last" })
	vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>", { desc = "Test Visit last" })

	vim.cmd([[
        let test#strategy = 'neovim'
        let g:test#preserve_screen = 1
        let g:test#neovim#start_normal = 1
    ]])

	if io.open("docker-compose.yml", "r") ~= nil then
		vim.cmd([[
            let test#php#phpunit#executable='docker compose exec php phpunit --testdox'
        ]])
	end
end

return {
	"vim-test/vim-test",
	config = config,
}
