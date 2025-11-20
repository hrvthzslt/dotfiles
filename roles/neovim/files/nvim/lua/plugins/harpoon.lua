local function config()
	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon Add" })
	vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "Harpoon List" })

	vim.keymap.set("n", "<leader>u", function()
		ui.nav_file(1)
	end)
    vim.keymap.set("n", "<leader>1", function()
        ui.nav_file(1)
    end)
	vim.keymap.set("n", "<leader>i", function()
		ui.nav_file(2)
	end)
    vim.keymap.set("n", "<leader>2", function()
        ui.nav_file(2)
    end)
	vim.keymap.set("n", "<leader>o", function()
		ui.nav_file(3)
	end)
    vim.keymap.set("n", "<leader>3", function()
        ui.nav_file(3)
    end)
	vim.keymap.set("n", "<leader>z", function()
		ui.nav_file(4)
	end)
    vim.keymap.set("n", "<leader>y", function()
        ui.nav_file(4)
    end)
    vim.keymap.set("n", "<leader>4", function()
        ui.nav_file(4)
    end)
end

return {
	"ThePrimeagen/harpoon",
	branch = "master",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
