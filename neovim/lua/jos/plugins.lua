local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  max_jobs = 50, -- not specifying can give 'too many open files' errors
  git = {
    clone_timeout = 120, -- Timeout, in seconds, for git clones
  },
})

-- PLUGINS
return packer.startup(function(use)
  -- base
  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins

  -- editing
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({ "vim-scripts/easydir.vim" }) -- Create directories and files at the same time
  use({ "junegunn/vim-easy-align" }) -- <number> or '*' for count, followed by character to align on
  use({ "tpope/vim-repeat" })
  use({ "tpope/vim-unimpaired" })
  use({ "tpope/vim-abolish" })
  use({
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  })

  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  })
  use({
    "dhruvasagar/vim-table-mode",
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  })

  -- text objects
  use({ "wellle/targets.vim" }) -- Use 'ia'/'aa' for arguments, or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
  use({ "michaeljsmith/vim-indent-object" }) -- provides "i" indent object (e.g. "vai")
  use({
    "kana/vim-textobj-line", -- provides al/il
    requires = "kana/vim-textobj-user",
  })
  use({ "julian/vim-textobj-variable-segment" }) -- provides av/iv for camel- and snake-case segments

  --display
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          icons_enabled = false,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
  })
  use({ "jeffkreeftmeijer/vim-numbertoggle" })
  use({
    "kevinhwang91/nvim-ufo", -- better folding
    requires = "kevinhwang91/promise-async",
  })
  use({ "ntpeters/vim-better-whitespace" }) -- adds `:StripWhitespace` command`
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  }) -- highlights
  -- PERF: foo
  -- HACK: bar
  -- TODO: baz
  -- NOTE: foo
  -- FIX: bar
  -- WARN: baz
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  })

  -- nvim-bqf
  use({ "kevinhwang91/nvim-bqf", ft = "qf" })
  -- optional nvim-bqf dependency
  use({
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  })

  -- nvim-colorizer
  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- startup
  use({ "dstein64/vim-startuptime" }) -- measure neovim startup time
  use({ "lewis6991/impatient.nvim" }) -- spped up startup by caching

  -- colorschemes
  use({ "embark-theme/vim", as = "embark" })
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "onsails/lspkind-nvim" }) -- add icons to completion popup menu

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- snippets for LuaSnip

  -- LSP
  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({
    "RubixDev/mason-update-all",
    config = function()
      require("mason-update-all").setup({
        vim.api.nvim_create_autocmd("User", {
          pattern = "MasonUpdateAllComplete",
          callback = function()
            print("mason-update-all has finished")
          end,
        }),
      })
    end,
  })
  use({
    "nvimtools/none-ls.nvim", -- for formatters and linters
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({ "RRethy/vim-illuminate" }) -- highlight other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching
  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "molecule-man/telescope-menufacture",
    config = function()
      require("telescope").load_extension("menufacture")
    end,
  })

  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 50,
          mappings = {
            list = {
              { key = "u", action = "dir_up" },
            },
          },
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end,
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-context" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })

  -- Git
  use({ "tpope/vim-fugitive" })
  use({ "tpope/vim-rhubarb" }) -- enable GitHub features in Fugitive
  use({ "sodapopcan/vim-twiggy" }) -- git branch operations
  use({ "lewis6991/gitsigns.nvim" })
  use({
    "rhysd/git-messenger.vim",
    config = function()
      vim.g.git_messenger_floating_win_opts = { border = "single" }
    end,
  })
  use({ "rhysd/committia.vim" })
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        ssh_aliases = { ["wordbank.github.com"] = "github.com" },
      })
    end,
  })

  -- Tmux
  use({ "christoomey/vim-tmux-navigator" })
  use({ "preservim/vimux" })

  -- Undo
  use({ "simnalamburt/vim-mundo", cmd = "MundoToggle" })

  -- Navigation
  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  })
  use({ "farmergreg/vim-lastplace" })

  -- Filesystem
  use({ "tpope/vim-eunuch" }) -- :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
  use({ "EinfachToll/DidYouMean" }) -- ask if I've mistyped a filename

  -- Buffers
  use({
    "axkirillov/hbac.nvim",
    config = function()
      require("hbac").setup({
        autoclose = true, -- set autoclose to false if you want to close manually
        threshold = 10, -- hbac will start closing unedited buffers once that number is reached
        close_command = function(bufnr)
          vim.api.nvim_buf_delete(bufnr, {})
        end,
        close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
      })
    end,
  })

  -- File formats
  use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })
  use({ "chr4/nginx.vim", ft = { "nginx" } })
  -- use({ "Glench/Vim-Jinja2-Syntax", ft = { "jinja2" } })
  use({ "chrisbra/csv.vim", ft = { "csv" } })
  use({ "Vimjas/vim-python-pep8-indent", ft = { "python" } })
  use({ "jeetsukumaran/vim-pythonsense", ft = { "python" } }) -- Add af/if for functions, ac/ic for classes, ]m, ]M, [m, [M for moving
  use({
    "linux-cultist/venv-selector.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("venv-selector").setup({
        name = ".direnv",
      })
    end,
    ft = { "python" },
  })

  -- Coding
  use({ "janko-m/vim-test" })
  use({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<F5>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<F1>",
            accept_word = "<F6>",
            accept_line = "<F7>",
            next = "<F3>",
            prev = "<F4>",
            dismiss = "<F2>",
          },
        },
        filetypes = {
          yaml = false,
          toml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
          sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
              -- disable for .env files
              return false
            end
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.secrets.*") then
              -- disable for .secrets files
              return false
            end
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%*.md") then
              -- disable for .md files
              return false
            end
            return true
          end,
        },
      })
    end,
  })
  use({ "joshuavial/aider.nvim" })

  use({ "KostkaBrukowa/definition-or-references.nvim" })

  -- Dash
  use({
    "mrjones2014/dash.nvim",
    run = "make install",
  })

  -- Sessions
  use({
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = {
          "/",
          "/Users",
          "/opt",
          "/private",
          "~/",
          "~/Downloads",
          "~/Projects",
        },
      })
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
