local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jos.lsp.mason"
require("jos.lsp.handlers").setup()
require "jos.lsp.null-ls"
