--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keymap = vim.keymap.set -- shorten function name
local opts = { silent = true } -- silent keymap option

local function createOpts(params)
  local result = opts

  -- If params table is provided, merge it with result
  if params then
    for k, v in pairs(params) do
      result[k] = v
    end
  end

  return result
end

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Line movement
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<localleader>,", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Turn off magic for everything apart from forward- and backslashes
keymap("x", "/", "<Esc>/\\%V", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Typos
vim.cmd([[command! -bang E e<bang>]])
vim.cmd([[command! -bang Q q<bang>]])
vim.cmd([[command! -bang W w<bang>]])
vim.cmd([[command! -bang QA qa<bang>]])
vim.cmd([[command! -bang Qa qa<bang>]])
vim.cmd([[command! -bang Wa wa<bang>]])
vim.cmd([[command! -bang WA wa<bang>]])
vim.cmd([[command! -bang Wq wq<bang>]])
vim.cmd([[command! -bang WQ wq<bang>]])
vim.cmd([[command! -bang Wn wn<bang>]])
vim.cmd([[command! -bang WN wn<bang>]])

-- Help
-- Open help in a vertical split instead of the default horizontal split
-- http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
vim.cmd([[cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>]])
vim.cmd([[cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>]])

-- Saving
-- Save normal buffers on <CR> - use `:update` to only save when modified -
-- also turn off search highlighting
keymap("n", "<CR>", "<ESC>:update<CR> | :nohls<CR>", opts)

-- Window movement
-- Use <tab> to move between windows
keymap("n", "<Tab>", "<C-w>w", opts)
keymap("n", "<S-Tab>", "<C-w>W", opts)
-- Tmux-like split panes navigation
keymap("n", "<C-W>|", ":vsplit<CR><C-W>l", opts)
keymap("n", "<C-W>-", ":split<CR><C-W>j", opts)
keymap("n", "<C-W><C-W>", "<C-W>w", opts)
keymap("n", "<leader>z", ":call system('tmux resize-pane -Z')<CR>", createOpts({ desc = "Toggle tmux window zoom" }))

-- Undo
keymap("n", "<Leader>du", ":MundoToggle<CR>", createOpts({ desc = "Toggle [Document] [U]ndo window" }))
keymap("i", "<c-w>", "<c-g>u<c-w>", opts) -- Drop an undo breakpoint so I can recover from insert-mode ctrl-w's
-- ...and do the same for punctuation
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", ":", ":<c-g>u", opts)

-- folding
keymap("n", "zO", "zCzO", opts) -- Make zO recursively open whatever top level fold we're in, no matter where the cursor happens to be.

-- Command window
keymap("c", "<C-c>", "<ESC>", opts)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Toggle diagnostics
keymap("n", "<leader>dt", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable()
  end
end, { desc = "Toggle diagnostics" })
