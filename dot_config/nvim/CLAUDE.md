# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A personal Neovim configuration based on kickstart.nvim, heavily customized. All config is Lua. Plugin management is via lazy.nvim.

## Key Commands

```bash
# Check config health
nvim +checkhealth

# Update plugins (inside nvim)
:Lazy update

# Install/manage LSP servers and tools (inside nvim)
:Mason

# Format Lua files
stylua lua/ init.lua

# Manage the Python venv used by Neovim's Python host
uv sync                    # install deps from pyproject.toml
```

The Python venv at `.venv/` is specifically for Neovim's `python3_host_prog` (pynvim), not for project work. It uses uv (`pyproject.toml` + `uv.lock`).

## Architecture

### Bootstrap Flow

`init.lua` is the entry point:
1. Loads `core.globals` (leader keys, nerd font flag, python host path)
2. Bootstraps lazy.nvim from git if missing
3. Calls `lazy.setup()` importing all specs from `core.plugins/`
4. Loads `core.options`, `core.keymaps`, `core.autocmds`, `core.change-root`

### Directory Layout

- `lua/core/globals.lua` -- Leader is `<Space>`, localleader is `,`
- `lua/core/options.lua` -- Editor options (4-space tabs, persistent undo, LSP-based folding)
- `lua/core/keymaps.lua` -- Global keymaps independent of plugins
- `lua/core/autocmds.lua` -- Autocommands (yank highlight, q-to-quit non-editable buffers, auto-resize splits, LSP fold-close on open)
- `lua/core/change-root.lua` -- Auto-cd to project root (finds `.git` or `Makefile` upward)
- `lua/core/plugins/*.lua` -- One file per plugin spec (lazy.nvim auto-imports the directory)
- `ftplugin/` -- Filetype-specific keymaps (Python breakpoints, noqa shortcuts)
- `after/ftplugin/` -- Filetype-specific option overrides (Python 4-space indent/80-col textwidth, Lua 2-space indent)
- `my_snippets/` -- UltiSnips-style snippet files (Python, CSS, sh, jade)

### Plugin Conventions

Each plugin gets its own file in `lua/core/plugins/`. The file returns a lazy.nvim plugin spec table. Keymaps specific to a plugin are defined inside that plugin's config file, not in `core/keymaps.lua`.

### Key Design Decisions

- **Colorscheme**: Catppuccin Mocha is the install colorscheme; rose-pine and kanagawa are also available
- **File explorer**: Oil.nvim (floating, opened with `-`) -- netrw is disabled
- **Fuzzy finder**: Telescope with fzf-native
- **Git**: Fugitive (`<leader>f` prefix), gitsigns, vim-twiggy for branches, octo.nvim for GitHub
- **LSP**: nvim-lspconfig + Mason for auto-install. Only `lua_ls` is explicitly configured; others use Mason defaults. LSP log level is set to `"error"` (change to `"debug"` when troubleshooting)
- **Completion**: nvim-cmp with LSP source
- **Formatting**: conform.nvim with format-on-save (stylua for Lua, ruff for Python, biome for JS/JSON, prettier for YAML/HTML/CSS)
- **Linting**: nvim-lint (hadolint for Dockerfiles, tflint for Terraform)
- **Testing**: neotest with neotest-python adapter
- **Debugging**: nvim-dap with dap-python and dap-go adapters
- **AI**: Copilot.lua (disabled for yaml, toml, markdown, gitcommit, .env, .secrets files)
- **Sessions**: auto-session (suppressed in home/Downloads/Projects root dirs)
- **Navigation**: leap.nvim (`s`/`S`), vim-tmux-navigator, vimux for tmux integration
- **Surround/textobjects**: mini.nvim (mini.ai, mini.surround with `,s` prefix, mini.splitjoin, mini.operators, mini.move with arrow keys)

### Notable Keymaps

- `<CR>` in normal mode saves the buffer and clears search highlighting
- `<Tab>`/`<S-Tab>` switch between windows
- `<leader>z` toggles tmux pane zoom
- `s`/`S` for leap motions
- `<leader>v` prefix for vimux commands
- `<leader>x` prefix for Trouble diagnostics
- `<leader>s` prefix for Telescope search
- `<leader>f` prefix for Fugitive git commands
- `,sa`/`,sd`/`,sr` for mini.surround (add/delete/replace)
- `-` opens Oil file browser
