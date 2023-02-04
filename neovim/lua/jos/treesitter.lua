local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"css",
		"diff",
		"dockerfile",
		"gitcommit",
		"gitignore",
		"go",
		"hcl",
		"html",
		"htmldjango",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"sql",
		"terraform",
		"toml",
		"yaml",
	}, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

	highlight = {
		enable = true, -- false will disable the whole extension
		-- Disable in large buffers, or for diff filetypes
		disable = function(lang, bufnr)
			return lang == "diff" or vim.api.nvim_buf_line_count(bufnr) > 50000
		end,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = { "diff", "python", "css" }, -- enabling this seems to break Python autoindent  ಠ_ಠ
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
        goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
        goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
        goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
      },
      swap = {
        enable = true,
        swap_next = { ['<leader>>'] = '@parameter.inner' },
        swap_previous = { ['<leader><'] = '@parameter.outer' },
      },
    },

})
