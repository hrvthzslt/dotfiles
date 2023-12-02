local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require("packer").reset()
require("packer").init({
    compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
    -- display = {
    --   open_fn = function()
    --     return require('packer.util').float()
    --   end,
    -- },
})

local use = require("packer").use

-- List plugins
use("wbthomason/packer.nvim")

-- Commenting support.
use({ "tpope/vim-commentary" })

-- Add, change, and delete surrounding text.
use({ "tpope/vim-surround" })

-- Useful commands like :Rename and :SudoWrite.
use({ "tpope/vim-eunuch" })

-- Allow plugins to enable repeating of commands.
use({ "tpope/vim-repeat" })

-- Navigate seamlessly between Vim windows and Tmux panes.
use({ "christoomey/vim-tmux-navigator" })

-- Jump to the last location when opening a file.
use({ "farmergreg/vim-lastplace" })

-- Enable * searching with visually selected text.
use({ "nelstrom/vim-visual-star-search" })

-- Automatically create parent dirs when saving.
use({ "jessarcher/vim-heritage" })

-- Automatically add closing brackets, quotes, etc.
use({ "windwp/nvim-autopairs" })

-- Split arrays and methods onto multiple lines, or join them back up.
use({ "AndrewRadev/splitjoin.vim" })

-- Automatically fix indentation when pasting code.
use({ "sickill/vim-pasta" })

-- Treesitter
use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
})
use({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
  requires = "nvim-treesitter/nvim-treesitter",
})

-- Colorscheme
use {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
}

-- Which key
use({ "folke/which-key.nvim" })

-- Auto session save and restore
use 'rmagatti/auto-session'

-- File explorer
use({
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons",
})

-- Harpoon for marking and navigating files the best way possible
use({
    "ThePrimeagen/harpoon",
    branch = "master",
    requires = { { "nvim-lua/plenary.nvim" } },
})

-- Fuzzy find
use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    requires = { { "nvim-lua/plenary.nvim" } },
})

-- Navigation
use {'ggandor/flit.nvim', requires = {'ggandor/leap.nvim'}}

-- Traverse past changes
use({ "mbbill/undotree" })

-- Status bar
use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
})

-- Word highlight
use 'RRethy/vim-illuminate'

-- Git
use({
    "kdheepak/lazygit.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
})
use({ "lewis6991/gitsigns.nvim" })
use { 'tpope/vim-fugitive' }

-- LSP
use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'jay-babu/mason-null-ls.nvim'
}
use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
}

-- Completion
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-nvim-lsp-signature-help'
use "L3MON4D3/LuaSnip"
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'

-- Php Refactoring
-- PHP Refactoring Tools
use({
    'phpactor/phpactor',
    ft = 'php',
    run = 'composer install --no-dev --optimize-autoloader',
})

-- Database
use {
    "tpope/vim-dadbod",
    requires = {
        "kristijanhusak/vim-dadbod-ui",
        "kristijanhusak/vim-dadbod-completion"
    },
}

-- Testing
use { 'vim-test/vim-test' }

-- Codeium
-- use 'Exafunction/codeium.vim'
-- Github copilot
use 'github/copilot.vim'
use 'ofseed/copilot-status.nvim'

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require("packer").sync()
end

-- Packer keymaps
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", { desc = "Packer Sync" })
vim.keymap.set("n", "<leader>pc", ":PackerCompile<CR>", { desc = "Packer Compile" })

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile>
  augroup end
]])
