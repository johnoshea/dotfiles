vim.opt.undofile = true -- enable persistent undo
vim.opt.undolevels = 10000 -- keep lots of undo information
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.swapfile = false -- don't create a swapfile
vim.opt.confirm = true -- get confirmation before doing anything stupid
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "preview" } -- mostly just for cmp
vim.opt.modeline = false -- disallow modelines for security reasons
vim.opt.showmatch = true -- briefly show matching bracket (if onscreen)
vim.opt.matchtime = 3 -- only show matching bracket for 0.3s
vim.opt.matchpairs:append("<:>") -- match angle-brackets as well

-- search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.infercase = true -- make completions smarter about cases
vim.opt.smartcase = true -- override 'ignorecase' when needed

vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- never show tabs
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time (displays which-key popup sooner)

-- tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.softtabstop = 4 -- insert 4 spaces for a tab
vim.opt.shiftround = true -- always round to a multiple of 'shiftwidth'

-- display
vim.opt.cursorline = true -- highlight the current line
vim.opt.inccommand = "split" -- preview substitutions live, as you type!
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbering
vim.opt.laststatus = 3 -- only the last window will always have a status line
vim.opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false -- hide the line and column number of the cursor position
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.virtualedit = "block,insert,onemore" -- allow the cursor to move to 'invalid' places
vim.opt.fillchars = "eob: ,diff:⣿,fold: ,foldopen:,foldsep: ,foldclose:"
VOL = vim.opt.listchars
VOL = "tab:» ,extends:›,precedes:‹" -- Use better looking listchars
VOL = VOL .. ",trail:·,nbsp:␣,eol:↲,conceal:┊"
vim.opt.showbreak = "↪  " -- Show ↪ at the beginning of wrapped lines
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-") -- treats words with `-` as single words
vim.opt.formatoptions:remove({ "r", "o" }) -- don't insert a comment leader on insert
vim.opt.formatoptions:append({ "n" }) -- recognize numbered lists
vim.opt.display:append("uhex") -- show unprintable characters as <xx>
vim.opt.linebreak = true -- wrap lines at characters in 'breakat', rather than the last character in the line
vim.opt.breakindent = true -- indent wrapped lines
vim.opt.nrformats = "hex" -- ignore octal/binary for incrementing/decrementing numbers

-- folding
vim.opt.foldcolumn = "1" -- automatically close folds when moving out of L1 folds
vim.opt.foldlevel = 99 -- nvim-ufo needs a large value
vim.opt.foldlevelstart = 99 -- set default fold level when editing in another window
vim.opt.foldenable = true -- fold by default
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()" -- use Neovim 0.10.3+ built-in LSP folding
vim.opt.foldmethod = "expr"

-- spelling
vim.opt.spell = false -- don't spellcheck by default
vim.opt.spellfile = "~/.config/nvim/custom-dictionary.utf-8.add"

-- wildignore
VOW = vim.opt.wildignore
VOW:append("*/.git/*,*/.hg/*,*/.svn/*") -- version control directories
VOW:append("*.pdf,*.zip,*.so") -- binaries
VOW:append("*.jpg,*.bmp,*.gif,*.png,*.jpeg") -- binary images
VOW:append("*.o,*.obj,*.exe,*.dll,*.manifest") -- compiled object files
VOW:append("*.spl") -- compiled spelling word lists
VOW:append("*.sw?") -- Vim swap files
VOW:append("*.DS_Store") -- OSX nonsense
VOW:append("migrations") -- Django migrations
VOW:append("*.pyc,*.pyo") -- Python byte code

-- TODO: find out if this is still needed
-- vim.opt.smartindent = true -- make indenting smarter again
