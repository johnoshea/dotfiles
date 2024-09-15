local keymap = vim.keymap.set       -- shorten function name
local opts = { silent = true }      -- silent keymap option

-- Add/remove pdb breakpoints
keymap("n", "<f7>", "Oimport pdb<CR>pdb.set_trace()<ESC>", opts)
keymap("n", "<leader><f7>", ":g/\\s*import pdb\\s*/d<CR>:g/\\s*pdb.set_trace()\\s*/d<CR>", opts)

-- Add/remove pytest breakpoints
keymap("n", "<f8>", "O# pylint: disable=no-member<CR><BS><BS>pytest.set_trace()<ESC>", opts)
keymap("n", "<leader><f8>", "/\\s*pytest.set_trace()\\s*/<CR>k2dd<ESC>", opts)

-- Add pylint/mypy "disable warning" directives
keymap("n", "<f9>", "<esc>A  # pylint: disable=", opts)
keymap("n", "<leader><f9>", "<esc>O# pylint: disable=", opts)
keymap("n", "<f10>", "<esc>A  # type: ignore<esc>", opts)

-- Add/remove pep8-disabling for a single line
keymap("n", "<localleader>q", "A  # noqa<ESC>", opts)
keymap("n", "<localleader>Q", ":s/  # noqa//<CR><ESC>", opts)
