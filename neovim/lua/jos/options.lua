vim.g.python3_host_prog = "~/src/dotfiles/neovim/.direnv/python-3.11.1/bin/python3"

vim.opt.backup = false                          -- don't create a backup file
vim.opt.backupcopy = "yes"                      -- using 'auto'/'no' may cause file-watching programs to miss changes
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.undolevels = 10000                      -- keep lots of undo information
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.swapfile = false                        -- don't create a swapfile
vim.opt.confirm = true                          -- get confirmation before doing anything stupid
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.modeline = false                        -- disallow modelines for security reasons
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.showmatch = true                        -- briefly show matching bracket (if onscreen)
vim.opt.matchtime = 3                           -- only show matching bracket for 0.3s
vim.opt.matchpairs:append("<:>")                -- match angle-brackets as well

-- search
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.infercase = true                        -- make completions smarter about cases
vim.opt.smartcase = true                        -- override 'ignorecase' when needed

vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- never show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)

-- tabs
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab
vim.opt.softtabstop = 4                         -- insert 4 spaces for a tab
vim.opt.shiftround = true                       -- always round to a multiple of 'shiftwidth'

-- display
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.cursorcolumn = true                     -- highlight 'end of reasonable line length'
vim.opt.colorcolumn = "80"                      -- indicate column 80
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbering
vim.opt.laststatus = 3                          -- only the last window will always have a status line
vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false                           -- hide the line and column number of the cursor position
vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.virtualedit = "block,insert,onemore"    -- allow the cursor to move to 'invalid' places
vim.opt.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.fillchars.diff = "⣿"                    -- set 'deleted lines' display for diff
VOL = vim.opt.listchars
VOL = "tab:» ,extends:›,precedes:‹"             -- Use better looking listchars
VOL = VOL .. ",trail:·,nbsp:␣,eol:↲,conceal:┊"
vim.opt.showbreak = "↪  "                       -- Show ↪ at the beginning of wrapped lines

vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
vim.opt.formatoptions:remove({ "r", "o" })      -- don't insert a comment leader on insert
vim.opt.formatoptions:append({ "n" })           -- recognize numbered lists
vim.opt.display:append("uhex")                  -- show unprintable characters as <xx>
vim.opt.linebreak = true                        -- wrap lines at characters in 'breakat', rather than the last character in the line
vim.opt.breakindent = true                      -- indent wrapped lines
vim.opt.nrformats = "hex"                       -- ignore octal/binary for incrementing/decrementing numbers

-- wildignore
VOW = vim.opt.wildignore
VOW:append("*/.git/*,*/.hg/*,*/.svn/*")         -- version control directories
VOW:append("*.pdf,*.zip,*.so")                  -- binaries
VOW:append("*.jpg,*.bmp,*.gif,*.png,*.jpeg")    -- binary images
VOW:append("*.o,*.obj,*.exe,*.dll,*.manifest")  -- compiled object files
VOW:append("*.spl")                             -- compiled spelling word lists
VOW:append("*.sw?")                             -- Vim swap files
VOW:append("*.DS_Store")                        -- OSX nonsense
VOW:append("migrations")                        -- Django migrations
VOW:append("*.pyc,*.pyo")                       -- Python byte code

-- folding
vim.opt.foldcolumn = '1'                        -- automatically close folds when moving out of L1 folds
vim.opt.foldlevel = 99                          -- nvim-ufo needs a large value
vim.opt.foldlevelstart = 99                     -- set default fold level when editing in another window
vim.opt.foldenable = true                       -- fold by default

-- spelling
vim.opt.spell = false                           -- don't spellcheck by default
vim.opt.spellfile = "~/.config/nvim/custom-dictionary.utf-8.add"

-- Disable Builtins
local builtins = {
  "gzip",
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "logiPat",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in ipairs(builtins) do
  vim.g["loaded_" .. plugin] = 1
end
