-- options
require "options"

-- Set <space> as leader key, ',' as localleader
--   NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

-- core
require "keymaps"
require "autocommands"
require "colorscheme"

-- plugin configs
require "cmp"
require "comment"
require "gitsigns"
require "indentline"
require "lsp"
require "nvim-ufo"
require "telescope"
require "treesitter"
require "vim-test"
require "change-root"
