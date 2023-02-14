return {
	-- base
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

  -- editing
  {
  	"numToStr/Comment.nvim",
  	config = function()
  		require("Comment").setup()
  	end,
  },
  "vim-scripts/easydir.vim", -- Create directories and files at the same time
  "gpanders/editorconfig.nvim",
  "junegunn/vim-easy-align", -- <number> or '*' for count, followed by character to align on
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "tpope/vim-abolish",
  {
  	"andymass/vim-matchup",
  	config = function()
  		vim.g.matchup_matchparen_offscreen = { method = "popup" }
  	end,
  },

  -- use `saiwi` to prompt for before/after text
  -- use `saiwt` to prompt for surrounding html tag
  -- use `sawif` to prompt for a surrounding function name
	{
		"machakann/vim-sandwich",
		config = function()
			vim.cmd([[runtime macros/sandwich/keymap/surround.vim]])
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		config = function()
			vim.g.table_mode_corner = "|"
		end,
	},

	-- text objects
	"wellle/targets.vim", -- Use 'ia'/'aa' for arguments, or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
	"jeetsukumaran/vim-pythonsense", -- Add af/if for functions, ac/ic for classes, ]m, ]M, [m, [M for moving
	"michaeljsmith/vim-indent-object", -- provides "i" indent object (e.g. "vai")
	{
		"kana/vim-textobj-line", -- provides al/il
		dependencies = "kana/vim-textobj-user",
	},
	-- "julian/vim-textobj-variable-segment", -- provides av/iv for camel- and snake-case segments

	--display
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	},
	"jeffkreeftmeijer/vim-numbertoggle",
	{
		"kevinhwang91/nvim-ufo", -- better folding
		dependencies = "kevinhwang91/promise-async",
	},
	"ntpeters/vim-better-whitespace", -- adds `:StripWhitespace` command`
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	}, -- highlights
	-- PERF: foo
	-- HACK: bar
	-- TODO: baz
	-- NOTE: foo
	-- FIX: bar
	-- WARN: baz

	-- Noice
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
		},
	},

	{
		"luukvbaal/statuscol.nvim",
		config = function()
			require("statuscol").setup({ setopt = true, order = "FSNs", separator = " " })
		end,
	},

	-- startup
	"dstein64/vim-startuptime", -- measure neovim startup time

	-- colorschemes
	"Shatur/neovim-ayu",
	"rebelot/kanagawa.nvim",

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind-nvim", -- add icons to completion popup menu

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- snippets for LuaSnip

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzf-native.nvim", build = "make",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	},

	-- Git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb", -- enable GitHub features in Fugitive
	"sodapopcan/vim-twiggy", -- git branch operations
	"lewis6991/gitsigns.nvim",
	{
		"rhysd/git-messenger.vim",
		config = function()
			vim.g.git_messenger_floating_win_opts = { border = "single" }
		end,
	},
	"rhysd/committia.vim",

	-- Tmux
	"christoomey/vim-tmux-navigator",
	"preservim/vimux",

	-- Undo
	"simnalamburt/vim-mundo", cmd = "MundoToggle",

	-- Navigation
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	"farmergreg/vim-lastplace",

	-- Filesystem
	"tpope/vim-eunuch", -- :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
	"EinfachToll/DidYouMean", -- ask if I've mistyped a filename

	-- File formats
	{ "tmux-plugins/vim-tmux", ft = { "tmux" } },
	{ "chr4/nginx.vim", ft = { "nginx" } },
	{ "Glench/Vim-Jinja2-Syntax", ft = { "jinja2" } },
	{ "Vimjas/vim-python-pep8-indent", ft = { "python" } },
	{ "HallerPatrick/py_lsp.nvim", ft = { "python" } },
	{ "chrisbra/csv.vim", ft = { "csv" } },

	-- Coding
	"janko-m/vim-test",

	-- Sessions
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	},
}
