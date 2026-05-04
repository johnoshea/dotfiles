# Upgrading to Neovim 0.12

Written 2026-04-04, based on 0.12.0 release (2026-03-29) and nvim-treesitter archive (2026-04-03).

Target upgrade window: late April 2026.

## Before starting: check back on these

The ecosystem is days old. Before beginning the upgrade, research the current state of:

- [ ] **nvim-treesitter rewrite stability.** The rewrite was archived the same week as the 0.12 release. Check the repo README, open issues, and r/neovim for reports of breakage. The rewrite explicitly does not support lazy-loading -- confirm whether lazy.nvim has a clean workaround or if the community has converged on a pattern.
- [ ] **nvim-treesitter-context compatibility.** Does it work with the rewritten nvim-treesitter? Check its issue tracker.
- [ ] **rainbow-delimiters.nvim compatibility.** Same question -- depends on treesitter internals that may have shifted.
- [ ] **vim-matchup treesitter module.** Matchup has a treesitter integration that may need updating.
- [ ] **Built-in completion maturity.** Search r/neovim and GitHub discussions for `vim.lsp.completion.enable()` and `'autocomplete'` experience reports. Key questions: is it reliable? Do people miss buffer/path sources? Are there dealbreaking gaps vs nvim-cmp?
- [ ] **Plugin compatibility broadly.** Check issue trackers for: oil.nvim, hover.nvim, trouble.nvim, neotest, nvim-dap-ui, octo.nvim, copilot.lua, auto-session. These are complex plugins that touch many Neovim APIs.
- [ ] **mason-lspconfig vs vim.lsp.enable().** Has the community settled on a migration pattern? mason-lspconfig may have updated to support 0.12 natively, or may be unnecessary with `vim.lsp.enable()`.

## Phase 1: Update Neovim and fix breakage

Goal: running on 0.12 with the existing plugin set, everything working.

### Breaking changes to fix in our config

1. **`vim.diff` renamed to `vim.text.diff`.** Grep the config for `vim.diff` usage.
2. **Diagnostic signs.** If diagnostic signs are configured via `sign_define()` or `:sign-define`, migrate to `vim.diagnostic.config({ signs = { ... } })`. Check lspconfig.lua.
3. **`vim.treesitter.get_parser()` returns nil instead of throwing.** Grep for `pcall` wrappers around `get_parser` -- they're now unnecessary but harmless. More importantly, any code that assumes `get_parser()` always returns a value will crash.
4. **`vim.diagnostic.disable()` and `vim.diagnostic.is_disabled()` removed.** Grep for these. Use `vim.diagnostic.enable(false)` and check the enabled state via `vim.diagnostic.is_enabled()`.
5. **`'shelltemp'` now defaults to false.** Unlikely to matter, but note it.
6. **URI parsing is stricter (RFC3986).** Could affect `gx` or custom URI handling.
7. **`Query:iter_matches()` "all" option removed.** Check if any config or plugin code uses this.

### Migrate nvim-treesitter

The archived rewrite requires Neovim 0.12+ and is an incompatible new plugin. Steps:

1. Pin to the rewrite (not the `master` branch, which is the legacy 0.11 version).
2. Re-run `:TSUpdate` to rebuild all parsers.
3. Rewrite the plugin spec -- the config API has changed. Consult the new README.
4. Confirm `ensure_installed` parsers all work: bash, diff, html, lua, luadoc, markdown, markdown_inline, python, query, vim, vimdoc.
5. Verify highlighting, indentation, and folding all behave correctly.
6. The rewrite does not support lazy-loading. Configure accordingly in lazy.nvim (set `lazy = false` explicitly).

## Phase 2: Replace nvim-cmp with built-in completion

This is the biggest simplification. Plugins to remove:

- `hrsh7th/nvim-cmp`
- `hrsh7th/cmp-nvim-lsp`
- `hrsh7th/cmp-path`
- `hrsh7th/cmp-buffer`
- `saadparwaiz1/cmp_luasnip`
- `L3MON4D3/LuaSnip`
- `rafamadriz/friendly-snippets`

### What replaces them

```lua
-- In your LSP on_attach or after vim.lsp.enable():
vim.lsp.completion.enable(true, client.id, bufnr, {
  cmp = function(a, b)
    -- custom sort if needed
  end,
})

-- For automatic triggering (like cmp's auto-popup):
vim.o.autocomplete = 'menu,menuone,noselect'  -- or whatever value works; check :help 'autocomplete'

-- For snippets, vim.snippet is built-in since 0.11.
-- friendly-snippets won't load automatically -- you lose those unless you load them manually.
```

### What you lose

- **Buffer completion source.** The new `'complete'` option has flags ("F{func}", "o") that may partially cover this. Research whether the built-in `'complete'` scanning is good enough.
- **Path completion source.** Same -- check if `'complete'` covers filesystem paths.
- **friendly-snippets library.** The built-in snippet engine can expand snippets but doesn't ship a collection. If you rely on these, you'd need to load them manually or accept the loss.
- **Per-source priority and grouping.** nvim-cmp's source groups let you show LSP results before buffer words. The built-in `cmp` sort function provides some control but it's less granular.
- **nvim-autopairs cmp integration.** Currently autopairs hooks into cmp's confirm event. Check if autopairs works with native completion's `CompleteDone` event.

### Fallback plan

If built-in completion isn't ready, consider [blink.cmp](https://github.com/Saghen/blink.cmp) as a lighter nvim-cmp alternative that's designed around 0.11+/0.12 APIs. Check its status at upgrade time.

## Phase 3: Drop plugins with built-in replacements

These should be straightforward, one at a time:

| Plugin | Built-in replacement | Notes |
|---|---|---|
| `simnalamburt/vim-mundo` | `:Undotree` | Direct replacement. Test that the built-in UI meets your needs. |
| `ray-x/lsp_signature.nvim` | Built-in signature help (`<C-s>` in insert mode) | 0.12 improved rendering. Remove and verify signature popups still work. |
| `jeffkreeftmeijer/vim-numbertoggle` | Default since 0.11 | Confirm relative number toggling works without it, then remove. |
| `farmergreg/vim-lastplace` | Default since 0.10 | Confirm cursor restore works without it, then remove. |
| `vim-scripts/easydir.vim` | `:wall ++p` | Creates parent dirs on save. Slightly different UX (save-time vs edit-time) -- decide if acceptable. |
| `nvim-lualine/lualine.nvim` (fidget component) | `vim.ui.progress_status()` in statusline | If using fidget.nvim for LSP progress, replace with a lualine component calling `vim.ui.progress_status()`. |

## Phase 4: Simplify LSP setup with vim.lsp.enable()

Currently using: nvim-lspconfig + mason + mason-lspconfig + mason-tool-installer.

0.12's `vim.lsp.enable()` provides native server lifecycle management. The migration path depends on how the mason ecosystem adapts:

**Option A: Keep Mason for installing, use vim.lsp.enable() for configuring.**
Mason still handles installing LSP servers and tools. But instead of mason-lspconfig's auto-setup, you define configs directly:

```lua
vim.lsp.config('lua_ls', { settings = { ... } })
vim.lsp.config('ruff', {})
-- etc.
vim.lsp.enable({'lua_ls', 'ruff', 'pyright', ...})
```

This would let you drop mason-lspconfig (the glue layer) while keeping Mason (the installer).

**Option B: Keep current setup if mason-lspconfig updates for 0.12.**
If mason-lspconfig releases a 0.12-compatible version that works cleanly, there may be little reason to change.

Research which option the community has converged on before deciding.

## Things to NOT change

- **lazy.nvim** -- staying as plugin manager per preference.
- **telescope.nvim** -- no built-in fuzzy finder replacement.
- **oil.nvim** -- no built-in file explorer replacement.
- **conform.nvim / nvim-lint** -- no built-in formatting/linting replacement.
- **gitsigns / fugitive / octo** -- no built-in git replacement.
- **nvim-dap** -- no built-in DAP replacement.
- **neotest** -- no built-in test runner.
- **trouble.nvim** -- built-in diagnostics list exists but trouble is significantly richer.
- **which-key.nvim** -- no built-in replacement.
- **leap.nvim** -- no built-in motion replacement.
- **copilot.lua** -- no built-in AI replacement.
- **auto-session** -- no built-in session management replacement.
- **mini.nvim modules** -- mini.surround, mini.ai, etc. have no built-in equivalents.

## New 0.12 features to adopt (not plugin replacements)

These are worth enabling regardless of plugin changes:

- **`'diffopt'` inline:char** -- much better inline diff highlighting.
- **`:lsp` command** -- interactive LSP client management.
- **`'exrc'` parent directory loading** -- evaluate whether this conflicts with or improves upon `core/change-root.lua`.
- **Treesitter incremental selection** -- `v_an`/`v_in` for node-based selection. Free, no plugin needed.
- **`'pumborder'`** -- native completion popup border.
- **`'winborder'`** -- global floating window border default.
- **Default statusline with diagnostics** -- if ever moving away from lualine, the default is now quite capable.
