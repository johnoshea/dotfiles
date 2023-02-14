local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {

    -- diagnostics should be configured using Mason wherever possible

    -- generic
    formatting.prettier.with {
      extra_filetypes = { "toml", "markdown", "md" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.trim_whitespace,
    formatting.trim_newlines,

    -- Python
    formatting.black.with { extra_args = { "--fast" } },
    formatting.isort,
    diagnostics.ruff,
    -- use the following for things like disabling specific typechecks, etc
    -- diagnostics.ruff.with { extra_args = { "--OPTION_HERE" } },

    -- Lua
    formatting.stylua,
  },
}
