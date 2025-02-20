local project = require("hrvthzslt.project")

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

    local conf = project.read_json_conf()

    if conf and conf.test and conf.test.python then
        vim.cmd(string.format("let test#python#pytest#executable='%s'", conf.test.python))
    end
end

return {
	"vim-test/vim-test",
	config = config,
}
