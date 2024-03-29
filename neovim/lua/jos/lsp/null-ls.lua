local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,
  sources = {
    -- Python
    formatting.black,
    formatting.isort,
    formatting.djlint,

    -- Lua
    formatting.stylua,

    -- HCL
    formatting.terraform_fmt,

    -- yaml
    -- diagnostics.yamllint,
    -- formatting.yamlfmt,

    -- xml
    -- formatting.xmlformatter,

    -- generic
    formatting.prettier.with({
      extra_filetypes = { "toml", "md" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--html-whitespace-sensitivity ignore" },
      disableLanguages = { "html" },
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
