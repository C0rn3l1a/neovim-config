local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- theme
    { 'rose-pine/neovim', as = 'rose-pine' },
    -- file explorer
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
	-- keymap helper
	{ "folke/which-key.nvim", lazy = true },
    ----- Code Features -----
	-- code highlight
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    -- LSP manager
    {
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
    },
    -- LSP server
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { -- Optional
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
        },
    },
    ----- /Code Features -----
	----- Telescope -----
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"ThePrimeagen/harpoon",
			"nvim-lua/plenary.nvim",
			"joshmedeski/telescope-smart-goto.nvim",
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-fugitive",
			"tpope/vim-rhubarb",
		},
	},
    {
        'm4xshen/autoclose.nvim',
        config = function () require("autoclose").setup({
            options = {
                disable_command_mode = true,
            }
        }) end
    },
	{
		"exosyphon/telescope-color-picker.nvim",
		config = function()
			vim.keymap.set("n", "<leader>uC", "<cmd>Telescope colors<CR>", { desc = "Telescope Color Picker" })
		end,
	},
    {
        "junegunn/fzf",
        build = ":call fzf#install()",
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    ----- /Telescope -----
	-- Harpoon
	"ThePrimeagen/harpoon",
	-- Undo Tree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
		end,
	},
    ----- GIT -----
	-- Git support (:Git <any git command>)
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive Panel" })
		end,
	},
    -- similar to gitlens
    "lewis6991/gitsigns.nvim",
    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Git blame
    -- {
    --     "f-person/git-blame.nvim",
    --     config = function ()
    --         require("gitblame").setup({
    --             enabled = false,
    --             delay = 100,
    --         })
    --     end,
    --     init = function ()
    --         vim.keymap.set("n", "<Leader>gl", ":GitBlameToggle<CR>","Git Blame Toggle")
    --     end
    -- },
    -- -- Git conflict markers
    -- {
    --     "rhysd/conflict-marker.vim",
    --     event = "VeryLazy",
    --     init = function ()
    --         -- disable the default hightlight group
    --         vim.g.conflict_marker_highlight_group = ''
    --
    --         -- Include text after begin and end markers
    --         vim.g.conflict_marker_begin = '^<<<<<<< .*$'
    --         vim.g.conflict_marker_end = '^>>>>>>> .*$'
    --
    --         vim.cmd('hightlight ConflictMarkerBegin guibg=#2f7366')
    --         vim.cmd('hightlight ConflictMarkerOurs guibg=#2e5049')
    --         vim.cmd('hightlight ConflictMarkerTheirs guibg=#344f69')
    --         vim.cmd('hightlight ConflictMarkerEnd guibg=#2f628e')
    --         vim.cmd('hightlight ConflictMarkerCommonAncestorHunk guibg=#754a81')
    --     end
    -- },
    ----- /GIT -----
    -- tmux support
    "nathom/tmux.nvim",
    -- comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    -- nicer fancier bottom line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },
    -- Clipboard manager
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
        },
    },
    -- Highlights unique letters in text for faster jumping with F{letter}
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
            })
        end,
    },
    -- more useful keymaps
    {
        "tummetott/unimpaired.nvim",
        config = function()
            require("unimpaired").setup()
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-S>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    -- Tests
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-rspec",
            "haydenmeade/neotest-jest",
            "zidhuss/neotest-minitest",
            "mfussenegger/nvim-dap",
        },
        opts = {},
        config = function()
            local neotest = require("neotest")

            local neotest_jest = require("neotest-jest")({
                jestCommand = "yarn jest --",
            })
            neotest_jest.filter_dir = function(name)
                return name ~= "node_modules" and name ~= "__snapshots__"
            end

            neotest.setup({
                adapters = {
                    neotest_jest,
                },
                output_panel = {
                    enabled = true,
                    open = "botright split | resize 15",
                },
                quickfix = {
                    open = false,
                },
            })
        end,
    },
}

-- load Lazy package manager
require("lazy").setup(plugins)
