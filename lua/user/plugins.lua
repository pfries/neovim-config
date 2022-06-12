local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- use 'ggandor/lightspeed.nvim'
    use 'machakann/vim-sandwich'
    use "folke/which-key.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/toggleterm.nvim"
    use "szw/vim-maximizer"
    use "junegunn/vim-easy-align"
    -- use "phongvcao/vim-stardict"
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use {
        "numToStr/Comment.nvim", -- Easily comment stuff
        requires = {"JoosepAlviste/nvim-ts-context-commentstring"}
    }

    use "nvim-lualine/lualine.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "ellisonleao/glow.nvim"
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            require'hop'.setup { }
        end
    }
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
            }
        end
    }
    use({
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
            })
        end,
    })
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'tami5/sqlite.lua', module = 'sqlite'}, -- for persistence
        }
   }
    use "junegunn/goyo.vim"
    use "wlemuel/vim-tldr"
    use "sunaku/vim-dasht"
--  use "lukas-reineke/indent-blankline.nvim"
--  use "goolord/alpha-nvim"
--  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}

    use {'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
    end
    }

    use {
        "michaelb/sniprun",
        requires = {"rcarriga/nvim-notify"},
        run = "bash ./install.sh"
    }

    use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "kyazdani42/nvim-web-devicons"
    use 'editorconfig/editorconfig-vim'
    use 'Scuilion/markdown-drawer'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use {
        'lewis6991/spellsitter.nvim',
        requires = { {"nvim-treesitter/nvim-treesitter"} },
        config = function()
            require('spellsitter').setup {
                enabled = true,
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
            }
        end,
    }

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "uga-rosa/cmp-dictionary"
    use "ray-x/cmp-treesitter"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "b0o/schemastore.nvim"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use 'folke/trouble.nvim'
    use 'ray-x/lsp_signature.nvim'
--    use 'simrat39/symbols-outline.nvim'
--    use {
--        'rmagatti/goto-preview',
--        config = function()
--            require('goto-preview').setup {}
--        end
--    }
    -- DAP
--    use {'mfussenegger/nvim-dap',
--        requires = {"Pocco81/DAPInstall.nvim"},
--        keys = { { "n", "<leader>db" }, { "n", "<leader>dB" } },
--    }
--    use {
--      "theHamsta/nvim-dap-virtual-text",
--      after = "nvim-dap",
--    }
--    use {
--      "nvim-telescope/telescope-dap.nvim",
--      requires = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim" },
--      after = "nvim-dap",
--      module = "telescope._extensions.dap",
--    }
--    use {
--      "rcarriga/nvim-dap-ui",
--      requires = { "mfussenegger/nvim-dap" },
--      after = "nvim-dap",
--    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-telescope/telescope-rg.nvim' },
            { 'nvim-telescope/telescope-github.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = {"tami5/sqlite.lua"}
    }
    use "tami5/sqlite.lua"
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-treesitter/playground"
    use "p00f/nvim-ts-rainbow"

    -- Git
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use "lewis6991/gitsigns.nvim"
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
