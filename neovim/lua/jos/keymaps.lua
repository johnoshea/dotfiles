local keymap = vim.keymap.set -- shorten function name
local opts = { silent = true } -- silent keymap option

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

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

-- Plugins --
-- Telescope
-- keymap("n", "<Leader><Leader>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader><Leader>", require("telescope").extensions.menufacture.find_files, opts)
keymap("n", "<Leader><CR>", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>`", ":Telescope marks<CR>", opts)
keymap("n", "<Leader>hi", ":Telescope command_history<CR>", opts)
keymap("n", "<Leader>he", ":Telescope help_tags<CR>", opts)
keymap("n", "<Leader>mp", ":Telescope keymaps<CR>", opts)
keymap("n", "<Leader>cm", ":Telescope commands<CR>", opts)
-- keymap("n", "<Leader>rg", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>rg", require("telescope").extensions.menufacture.grep_string, opts)
-- keymap("n", "<Leader>/", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>/", require("telescope").extensions.menufacture.live_grep, opts)
keymap("n", "<Leader>gf", ":Telescope git_files<CR>", opts)
keymap("n", "<Leader>C", ":Telescope git_commits<CR>", opts)
keymap("n", "<Leader>tg", ":Telescope treesitter<CR>", opts)
keymap("n", "<Leader>to", ":Telescope oldfiles<CR>", opts)
keymap("n", "<Leader>tz", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<Leader>TS", ":Telescope<space>", {})

-- Git
keymap("n", "<leader>gi", ":Git<CR>", opts)
keymap("n", "<leader>ga", ":Gwrite<CR>", opts)
keymap("n", "<leader>gc", ":Gcommit %<CR>", opts)
keymap("n", "<leader>gd", ":Git difftool<CR>", opts)
keymap("n", "<leader>g|", ":Gvdiffsplit<CR>", opts)
keymap("n", "<leader>go", ":windo diffoff<CR> | :only<CR>", opts)
keymap("n", "<leader>g_", ":Gdiffsplit<CR>", opts)
keymap("n", "<leader>gM", ":Git mergetool<CR>", opts)
keymap("n", "<leader>gl", ":Gclog<CR>", opts)
keymap("n", "<leader>g1", ":Git log --oneline<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)
keymap("n", "<leader>gf", ":Git fetch<CR>", opts)
keymap("n", "<leader>gps", ":Git push<CR>", opts)
keymap("n", "<leader>gpl", ":Git pull<CR>", opts)
keymap("n", "<leader>tw", ":Twiggy<CR>", opts)
keymap("n", "<leader>TW", ":Twiggy<space>", opts)

-- nvim-tree
keymap("n", "-", ":NvimTreeToggle<CR>", opts)

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
keymap("n", "<CR>", ":nohls<CR> | :update<CR>", opts)

-- Arrow keys
-- Repurpose arrow keys to move lines
-- Normal mode
keymap("n", "<Left>", "<<", opts)
keymap("n", "<Right>", ">>", opts)
keymap("n", "<Up>", ":<C-u>move-2<CR>==", opts)
keymap("n", "<Down>", ":<C-u>move+<CR>==", opts)

-- Visual mode
keymap("v", "<Left>", "<gv", opts)
keymap("v", "<Right>", ">gv", opts)
keymap("v", "<Up>", ":move-2<CR>gv=gv", opts)
keymap("v", "<Down>", ":move'>+<CR>gv=gv", opts)

-- Insert mode
keymap("i", "<Left>", "<C-D>", opts)
keymap("i", "<Right>", "<C-T>", opts)
keymap("i", "<Up>", "  <C-o>:move-2<CR>gv=gv", opts)
keymap("i", "<Down>", "<C-o>:move'>+<CR>gv=gv", opts)

-- Window movement
-- Use <tab> to move between windows
keymap("n", "<Tab>", "<C-w>w", opts)
keymap("n", "<S-Tab>", "<C-w>W", opts)
-- Tmux-like split panes navigation
keymap("n", "<C-W>|", ":vsplit<CR><C-W>l", opts)
keymap("n", "<C-W>-", ":split<CR><C-W>j", opts)
keymap("n", "<C-W><C-W>", "<C-W>w", opts)
keymap("n", "<leader>z", ":call system('tmux resize-pane -Z')<CR>", opts)
keymap("n", "<Leader>vp", ":VimuxPromptCommand<CR>", opts)
keymap("n", "<Leader>vl", ":VimuxRunLastCommand<CR>", opts)
keymap("n", "<Leader>vi", ":VimuxInspectRunner<CR>", opts)
keymap("n", "<Leader>vq", ":VimuxCloseRunner<CR>", opts)
keymap("n", "<Leader>vx", ":VimuxInterruptRunner<CR>", opts)
keymap("n", "<Leader>vr", ":VimuxRunCommand<CR>", opts)
keymap("n", "<Leader>vz", ":call VimuxZoomRunner()<CR>", opts) -- Zoom the runner pane (use <bind-key> z to restore runner pane)

-- Undo
keymap("n", "<Leader>u", ":MundoToggle<CR>", opts)
keymap("i", "<c-w>", "<c-g>u<c-w>", opts) -- Drop an undo breakpoint so I can recover from insert-mode ctrl-w's
-- ...and do the same for punctuation
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", ":", ":<c-g>u", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- vim-test
keymap("n", "<leader>tf", "<CMD>TestFile<CR>", opts)
keymap("n", "<leader>tn", "<CMD>TestNearest<CR>", opts)
keymap("n", "<leader>tl", "<CMD>TestLast<CR>", opts)
keymap("n", "<leader>tv", "<CMD>TestVisit<CR>zz", opts)
keymap("n", "<leader>ts", "<CMD>TestSuite<CR>", opts)

-- Line numbers
keymap("n", "<leader>1", ":set relativenumber!<cr>", opts)
keymap("n", "<leader>2", ":set nonumber!<cr>:set norelativenumber!<cr>", opts)

-- vim-easy-align
keymap("x", "ga", "<Plug>(EasyAlign)", opts) -- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap("n", "ga", "<Plug>(EasyAlign)", opts) -- Start interactive EasyAlign for a motion/text object (e.g. gaip)

-- folding
keymap("n", "zO", "zCzO", opts) -- Make zO recursively open whatever top level fold we're in, no matter where the cursor happens to be.

-- Command window
keymap("c", "<C-c>", "<ESC>", opts)
