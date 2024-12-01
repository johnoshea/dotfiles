local keymap = vim.keymap.set -- shorten function name
local opts = { silent = true } -- silent keymap option

vim.opt_local.wrap = true
vim.opt_local.spell = true

-- Use 'Marked.app' for Markdown previews
keymap("n", "<leader>ma", ':!open -a "/Applications/Marked 2.app" "%:p"<cr>', opts)
