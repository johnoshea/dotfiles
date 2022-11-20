local keymap = vim.keymap.set       -- shorten function name
local opts = { silent = true }      -- silent keymap option

-- Use 'Marked.app' for Markdown previews
keymap("n", "<leader>ma", ":silent !open -a Marked 2.app '%:p'<cr>", opts)
