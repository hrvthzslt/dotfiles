-- LSP clients attached to buffer
local clients_lsp = function()
	local bufnr = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.buf_get_clients(bufnr)
	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in pairs(clients) do
		if client.name ~= "copilot" then
			table.insert(c, string.sub(client.name, 1, 1))
		end
	end
	return "󰢾 " .. table.concat(c, "")
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

local truncated_branch = function()
	local branch = vim.fn.FugitiveHead()

	if branch == "" then
		return ""
	end

	local limit = 10
	local postfix = ""

	if string.len(branch) > limit then
		postfix = "…"
	end

	return string.sub(branch, 1, limit) .. postfix
end

local function config()
	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
			-- theme = "gruvbox-material",
		},
		sections = {
			lualine_a = { logo },
			lualine_b = {
				truncated_branch,
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
				},
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
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = config,
}
