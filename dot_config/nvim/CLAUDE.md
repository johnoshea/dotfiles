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

The Python venv at `.venv/` is specifically for Neovim's `python3_host_prog` (pynvim), not for project work. It uses uv (`pyproject.toml` + `uv.lock`) and pins Python 3.14.

## Architecture

### Bootstrap Flow

`init.lua` is the entry point:

1. Loads `core.globals` (leader keys, nerd font flag, python host path, markdown fenced languages)
2. Bootstraps lazy.nvim from git if missing
3. Calls `lazy.setup()` importing all specs from `core.plugins/`, and disables the built-in netrw/zip/tar/matchit plugins
4. Loads `core.options`, `core.keymaps`, `core.autocmds`, `core.change-root`

### Directory Layout

- `lua/core/globals.lua` -- Leader is `<Space>`, localleader is `,`
- `lua/core/options.lua` -- Editor options (4-space tabs, persistent undo, no swapfile, LSP-based folding, custom spellfile)
- `lua/core/keymaps.lua` -- Global keymaps independent of plugins
- `lua/core/autocmds.lua` -- Autocommands (yank highlight, q-to-quit non-editable buffers, read-only fugitive buffers, auto-resize splits, diagnostics off in `.env`/`.secrets.toml`, cursorline only in the active window, LSP fold-close on open)
- `lua/core/change-root.lua` -- Auto-cd to project root (finds `.git` or `Makefile` upward)
- `lua/core/health.lua` -- `:checkhealth kickstart` provider, inherited from kickstart.nvim
- `lua/core/plugins/*.lua` -- One file per plugin spec (lazy.nvim auto-imports the directory)
- `ftplugin/<ft>/settings.lua` -- Filetype-specific keymaps and local options (Python breakpoints and noqa shortcuts, markdown preview, spell/wrap for prose, git fold settings)
- `after/ftplugin/*.lua` -- Filetype option overrides applied last (Python 4-space indent and 80-col textwidth, Lua 2-space indent and 120-col, markdown 80-col)
- `my_snippets/` -- Legacy UltiSnips-format snippets. Nothing loads these; completion snippets come from LuaSnip plus friendly-snippets.

### Plugin Conventions

Each plugin gets its own file in `lua/core/plugins/`. The file returns a lazy.nvim plugin spec table. Keymaps specific to a plugin are defined inside that plugin's config file, not in `core/keymaps.lua`.

### Key Design Decisions

- **Colorscheme**: rose-pine, set in its own `config` function and named as lazy.nvim's install-time colorscheme in `init.lua`
- **File explorer**: Oil.nvim (floating, opened with `-`) -- netrw is disabled. yazi.nvim is also available under `<leader>-`.
- **Fuzzy finder**: fzf-lua, on stock defaults (no setup profile). It also owns `vim.ui.select` via `register_ui_select()`.
- **Git**: Fugitive (`<leader>f` prefix), gitsigns (`<leader>h` prefix), vim-twiggy for branches, octo.nvim for GitHub (`picker = "fzf-lua"`), git-messenger, committia for commit-message buffers
- **LSP**: nvim-lspconfig + Mason (mason-lspconfig **v2**). Only `lua_ls` carries explicit settings; every other Mason-installed server is auto-enabled with defaults. LSP log level is `"error"` (switch to `"debug"` to troubleshoot). Diagnostics use nerd-font signs and `virtual_lines` on the current line. **Gotcha:** v2 dropped kickstart's `handlers` API and auto-enables every installed server via `vim.lsp.enable()`. Per-server overrides in the `servers` table (`nvim-lspconfig.lua`) are applied through `vim.lsp.config()` -- the old `require("lspconfig")[name].setup()` handler is silently ignored, so settings placed there never reach the server.
- **Hover**: hover.nvim owns `K` and `gK`, not `vim.lsp.buf.hover`. Providers are LSP, GitHub, man and dictionary.
- **Completion**: blink.cmp, pinned to `1.*`, with the `default` keymap preset -- `<C-y>` accepts, `<C-n>`/`<C-p>` select, `<C-b>`/`<C-f>` scroll the docs, `<C-l>`/`<C-h>` move through a snippet. Sources are `lsp`, `path` and `snippets`, plus `lazydev` in Lua buffers; there is no `buffer` source. mini.snippets is the snippet engine (`snippets.preset = "mini_snippets"`), reading friendly-snippets' VSCode-format JSON through `gen_loader.from_lang()`.
- **Treesitter**: nvim-treesitter on the **`main`** branch. That branch has no `ensure_installed` option -- the spec's `init` function diffs a hard-coded parser list against `require("nvim-treesitter.config").get_installed()` and calls `require("nvim-treesitter").install()`. Highlighting and indent are turned on by a `FileType` autocmd, also in the spec.
- **Formatting**: conform.nvim with format-on-save. stylua for Lua, ruff for Python, biome for JS/TS/JSON, prettier for CSS, rumdl for Markdown, shfmt for shell, yamlfmt for YAML, djlint for Django templates, and two hand-registered formatters -- `superhtml` for HTML and `hclfmt` for HCL. C and C++ are excluded from format-on-save.
- **Linting**: nvim-lint on `BufEnter`/`BufWritePost`/`InsertLeave`, and only in modifiable buffers. ruff, rumdl, djlint, hadolint, biomejs, tflint, shellcheck. Values are nvim-lint linter names, not shell commands, and keys must be real Neovim filetypes.
- **Markdown**: md-render.nvim renders tables, images, mermaid and styled text in-editor, on `<leader>mp`. It has **no top-level `setup()`** -- giving its lazy.nvim spec an `opts` table makes lazy call a nil function and the plugin fails to load. Tunables live in submodules such as `md-render.text_size` and `md-render.image`. Graphics use the Kitty protocol, which needs `set -g allow-passthrough on` in `~/.tmux.conf`; text rendering works without it.
- **Large files**: snacks.nvim, with only its `bigfile` module enabled. It triggers on size or on average line length over 1000, which catches minified files.
- **Testing**: neotest with neotest-python adapter. Coverage highlighting via nvim-coverage.
- **Debugging**: nvim-dap with dap-ui and mason-nvim-dap. dap-go uses Mason's delve. dap-python is set up with `"uv"`, so the adapter runs through `uv run --with debugpy` and debugpy is never installed into a venv or into Mason. The program being debugged still runs under the project's own interpreter.
- **Python environments**: venv-selector (`,v`), with `options.picker = "fzf-lua"`
- **Search and replace**: grug-far (`<leader>gf`) on the default ripgrep engine; `<localleader>e` swaps to ast-grep inside the buffer
- **Sessions**: auto-session (suppressed in home/Downloads/Projects root dirs)
- **Navigation**: leap.nvim (`s`/`S`, from the Codeberg fork), vim-tmux-navigator, vimux for tmux integration, waypoint.nvim for marks. waypoint uses telescope for its "transfer waypoints to file" action when telescope is present; we do not install it, so that one action falls back to a pre-filled command line.
- **mini.nvim modules**: mini.ai, mini.surround (`,s` prefix), mini.splitjoin, mini.operators, mini.pairs, mini.snippets, mini.move (arrow keys). mini.ai is disabled in fugitive buffers because the keymaps clash. mini.pairs closes brackets as you type; blink.cmp's `auto_brackets` is separate and only fires when a callable completion is accepted.
- **No AI plugin**: Copilot and friends are not installed.

### Notable Keymaps

- `<CR>` in normal mode saves the buffer and clears search highlighting
- `<localleader>,` clears search highlighting without saving
- `<Tab>`/`<S-Tab>` switch between windows
- `<S-h>`/`<S-l>` switch between buffers
- `<leader>z` toggles tmux pane zoom
- `<leader>du` opens the Mundo undo tree; `<leader>dt` toggles diagnostics
- `K`/`gK` hover (hover.nvim)
- `s`/`S` for leap motions
- `-` opens Oil; `<leader>-` prefix opens yazi
- `<leader>v` prefix for vimux commands
- `<leader>x` prefix for Trouble diagnostics
- `<leader>s` prefix for fzf-lua search
- `<leader>f` prefix for Fugitive git commands
- `<leader>h` prefix for gitsigns hunk actions
- `<leader>F` formats the buffer with conform
- `<leader>mp` md-render markdown preview; `<leader>ma` is the separate Marked.app preview
- `,sa`/`,sd`/`,sr` for mini.surround (add/delete/replace)
- `,v` selects a Python virtualenv
