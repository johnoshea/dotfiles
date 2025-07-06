-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set the filetype for help files, which sometimes don't have it set
vim.cmd([[
  augroup help_ft
    autocmd!
    autocmd BufRead,BufEnter *.txt if &buftype == 'help' | setfiletype help | endif
  augroup END
]])

-- 'q' quits non-editable windows immediately
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "Trouble" },
  -- leave <CR> on its original behavior for quickfix lists, etc
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <CR> <CR>
      set nobuflisted
    ]])
  end,
})

-- fugitive buffers shouldn't be writable
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "fugitive" },
  callback = function()
    vim.opt_local.bufhidden = "delete"
    vim.opt_local.modifiable = false
    vim.opt_local.readonly = true
  end,
})

-- don't run mini.ai in fugitive buffers (keymaps clash)
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "fugitive" },
  callback = function()
    vim.b.miniai_disable = true
  end,
})

-- resize splits if the nvim/terminal window is resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- don't show diagnostics for "secrets"-type files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { ".env", ".secrets.toml" },
  callback = function(args)
    vim.diagnostic.enable(false, args.buf)
  end,
})

-- show cursor line only in active window
local cursorGrp = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
vim.api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)
