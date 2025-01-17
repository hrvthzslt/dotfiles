local function config()
	local lspkind = require("lspkind")

	local cmp = require("cmp")

	require("luasnip.loaders.from_vscode").lazy_load()
	local luasnip = require("luasnip")

	cmp.setup({
		preselect = "item",
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		mapping = cmp.mapping.preset.insert({
			["<C-o>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}),
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		formatting = {
			format = lspkind.cmp_format(),
		},
	})

	cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
		sources = {
			{ name = "vim-dadbod-completion" },
			{ name = "buffer" },
		},
	})
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"kristijanhusak/vim-dadbod-completion",
	},
	config = config,
}
