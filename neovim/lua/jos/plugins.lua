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
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- PLUGINS
return packer.startup(function(use)
  -- base
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins

  -- editing
  use {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
    end
  }
  use { "cohama/lexima.vim" }
  use { "vim-scripts/easydir.vim" } -- Create directories and files at the same time
  use { "gpanders/editorconfig.nvim" }
  use { "hrsh7th/nvim-pasta" }
  use { "junegunn/vim-easy-align" } -- <number> or '*' for count, followed by character to align on
  use { "tpope/vim-repeat" }
  use { "tpope/vim-unimpaired" }
  use { "tpope/vim-abolish" }
  use {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  -- use `saiwi` to prompt for before/after text
  -- use `saiwt` to prompt for surrounding html tag
  -- use `sawif` to prompt for a surrounding function name
  use {
    "machakann/vim-sandwich",
    vim.cmd[[runtime macros/sandwich/keymap/surround.vim]]
  }
  use {
    "dhruvasagar/vim-table-mode",
    config = function()
      vim.g.table_mode_corner = '|'
    end
  }


  -- text objects
  use { "wellle/targets.vim" } -- Use 'ia'/'aa' for arguments, or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
  use { "jeetsukumaran/vim-pythonsense" } -- Add af/if for functions, ac/ic for classes, ]m, ]M, [m, [M for moving
  use { "michaeljsmith/vim-indent-object" } -- provides "i" indent object (e.g. "vai")
  use { "kana/vim-textobj-line", -- provides al/il
    requires = "kana/vim-textobj-user" }
  use { "julian/vim-textobj-variable-segment" } -- provides av/iv for camel- and snake-case segments


  --display
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "nvim-lualine/lualine.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use {
    "folke/trouble.nvim",
    require("trouble").setup()
  }
  use { "jeffkreeftmeijer/vim-numbertoggle" }
  use {
    "kevinhwang91/nvim-ufo", -- better folding
    requires = "kevinhwang91/promise-async"
  }
  use { "ntpeters/vim-better-whitespace" } -- adds `:StripWhitespace` command`
  use {
    "rrethy/vim-hexokinase",
    run = "cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase/ && make hexokinase",
  }


  -- startup
  use { "dstein64/vim-startuptime" } -- measure neovim startup time
  use { "lewis6991/impatient.nvim" } -- spped up startup by caching


  -- colorschemes
  use { "Shatur/neovim-ayu" }
  use { "rebelot/kanagawa.nvim" }


  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "onsails/lspkind-nvim" }  -- add icons to completion popup menu


  -- snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- snippets for LuaSnip


  -- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" } -- highlight other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching


  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = 'make' }


  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }


  -- Git
  use { "tpope/vim-fugitive" }
  use { "tpope/vim-rhubarb" } -- enable GitHub features in Fugitive
  use { "sodapopcan/vim-twiggy" } -- git branch operations
  use { "lewis6991/gitsigns.nvim" }
  use { "rhysd/committia.vim", config = "vim.g.committia_open_only_on_vim_starting = 1" }
  use { "rhysd/git-messenger.vim", config = "vim.g.git_messenger_floating_win_opts = { border = 'single' }" }


  -- Tmux
  use { "christoomey/vim-tmux-navigator" }
  use { "preservim/vimux" }

  -- Undo
  use { "simnalamburt/vim-mundo", cmd = "MundoToggle" }


  -- Navigation
  use { "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  }
  use { "farmergreg/vim-lastplace" }


  -- Filesystem
  use { "tpope/vim-eunuch" } -- :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
  use { "EinfachToll/DidYouMean" } -- ask if I've mistyped a filename


  -- File formats
  use { "tmux-plugins/vim-tmux", ft = { "tmux" } }
  use { "chr4/nginx.vim", ft = { "nginx" } }
  use { "Glench/Vim-Jinja2-Syntax", ft = { "jinja2" } }


  -- Coding
  use { "janko-m/vim-test" }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
