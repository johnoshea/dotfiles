" nvim/init.vim
" Author: John O'Shea <john.m.oshea@gmail.com>
" Source: <https://github.com/johnoshea/dotfiles>

let g:python3_host_prog = expand('~/.config/nvim/.direnv/python-3.9.4/bin/python3')
let g:loaded_python_provider = 0

" Leader keys --- {{{
let g:mapleader="\<Space>"
let g:maplocalleader=','
" Leader keys end }}}
" Plugins --- {{{
call plug#begin('~/.config/nvim/plugged')
" Treesitter --- {{{
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" }}}
" LSP --- {{{
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/williamboman/nvim-lsp-installer'
" LSP end --- }}}
" Completion --- {{{
" nvim-cmp --- {{{
Plug 'https://github.com/hrsh7th/nvim-cmp'
" }}}
" nvim-cmp helpers --- {{{
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
" snippet engine
Plug 'https://github.com/L3MON4D3/LuaSnip'
" make LuaSnip work with nvim-cmp
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'
" snippets for LuaSnip
Plug 'https://github.com/rafamadriz/friendly-snippets'
" buffer completion source
Plug 'https://github.com/hrsh7th/cmp-buffer'
" path completion source
Plug 'https://github.com/hrsh7th/cmp-path'
" add icons to lsp completion popup menu
Plug 'https://github.com/onsails/lspkind-nvim'
" }}}
" Completion end }}}
" Colorschemes --- {{{
" srcery-vim --- {{{
Plug 'https://github.com/srcery-colors/srcery-vim'
let g:srcery_italic = 1
" Srcery end  --- }}}
" For light terminal sessions
Plug 'https://github.com/NLKNguyen/papercolor-theme'
" Experimentation
" Colorschemes end }}}
" Navigation/filesystem --- {{{
" FZF --- {{{
Plug '/usr/local/opt/fzf' | Plug 'https://github.com/junegunn/fzf.vim', { 'do': { -> fzf#install() } }
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git --ignore-file ~/.gitignore'
nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader><CR> :Buffers<CR>
nnoremap <silent> <Leader>` :Marks<CR>
nnoremap <silent> <Leader>hi :History<CR>
nnoremap <silent> <Leader>mp :Maps<CR>
nnoremap <silent> <Leader>cm :Commands<CR>
nnoremap <silent> <Leader>r :Rg<CR>
nnoremap <silent> <Leader>/ :Rg
nnoremap <silent> <Leader>gg :GGrep<CR>
nnoremap <silent> <Leader>gf :GFiles<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>tg :Tags<CR>
" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" cd to Notes dir (useful for Notational Velocity/Nebulous Notes)
nnoremap <leader>n :lcd ~/Documents/3\ Current/Notes<cr>:Files<cr>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
\ call fzf#vim#grep(
\   'git grep --line-number '.shellescape(<q-args>), 0,
\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Augmenting Rg command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Git files command with preview window
command! -bang -nargs=? -complete=dir GFiles
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" FZF end }}}
" lightspeed.nvim - show hints on 's', 'f', etc
Plug 'https://github.com/ggandor/lightspeed.nvim'
" Plugin: vim-obsession --- {{{
Plug 'https://github.com/tpope/vim-obsession'
nnoremap <leader>o :Obsession<cr>
nnoremap <leader>O :Obsession!<cr>
" vim-obsession end }}}
" vim-eunuch
" :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
Plug 'https://github.com/tpope/vim-eunuch'
" Matching
Plug 'https://github.com/andymass/vim-matchup/'
" DidYouMean - avoid opening up new empty files if multiple completions
Plug 'https://github.com/EinfachToll/DidYouMean'
" Create directories and files at the same time
Plug 'https://github.com/vim-scripts/easydir.vim'
Plug 'https://github.com/justinmk/vim-dirvish'
" Plugin: remote-viewer --- {{{
" Allows 'Dirvish ssh://user@hostname/path'
Plug 'https://github.com/bounceme/remote-viewer'
nnoremap <leader>ss :Dirvish ssh://
" remote-viewer end }}}
" Navigation/filesystem end }}}
" Editing --- {{{
" vim-mundo --- {{{
Plug 'https://github.com/simnalamburt/vim-mundo', {'on': 'MundoToggle'}
nnoremap <leader>u :MundoToggle<CR>
" vim-mundo end }}}
" vim-easy-align --- {{{
" <number> or '*' for count, followed by character to align on
Plug 'https://github.com/junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" vim-easy-align end }}}
" Editorconfig --- {{{
Plug 'https://github.com/editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" Editorconfig end }}}
" vim-sandwich --- {{{
Plug 'https://github.com/machakann/vim-sandwich'
" vim-sandwich end }}}

Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/andymass/vim-visput'
" Editing end }}}
" Code editing --- {{{
" ale --- {{{
let g:ale_disable_lsp = 1
Plug 'https://github.com/dense-analysis/ale'
" Specific to file types and are here for reference
let g:ale_linters = {
			\	'css'            : ['csslint'],
            \   'dockerfile'     : ['hadolint'],
            \   'go'             : ['gopls'],
			\	'html'           : ['htmlhint', 'tidy'],
			\	'javascript'     : ['eslint'],
			\	'json'           : ['jsonlint'],
			\	'markdown'       : ['mdl'],
			\	'python'         : ['pylint', 'flake8', 'mypy'],
			\	'scss'           : ['sasslint'],
			\	'sh'             : ['shellcheck', 'shell'],
            \   'tf'             : ['tflint'],
			\	'vim'            : ['vint'],
			\	'yaml'           : ['yamllint'],
			\ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '%linter%> %code: %%s'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length=88'  " match 'black' formatter
let g:ale_python_mypy_options = '--follow-imports=silent'
" ale end }}}
" vim-test --- {{{
Plug 'https://github.com/janko-m/vim-test'
nmap <silent> <leader>tn <esc>:w<CR>:TestNearest<CR>
nmap <silent> <leader>tf <esc>:w<CR>:TestFile<CR>
nmap <silent> <leader>ts <esc>:w<CR>:TestSuite<CR>
nmap <silent> <leader>tl <esc>:w<CR>:TestLast<CR>
let g:test#strategy = 'vimux'
" vim-test end }}}
" Comment.nvim - use 'gcc', 'gbc', 'gco', 'gcO', 'gcA'
Plug 'https://github.com/numToStr/Comment.nvim'
" Pear-tree --- {{{
Plug 'https://github.com/tmsvg/pear-tree'
" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60
" Pear-tree end }}}
" Code editing end }}}
" Git --- {{{
" Fugitive --- {{{
Plug 'https://github.com/tpope/vim-fugitive'
augroup fugitive
    autocmd!
    " Auto-clean fugitive buffers.
    autocmd BufReadPost fugitive://* set bufhidden=delete

    nnoremap <leader>gs :Git<CR>
    nnoremap <leader>ga :Gwrite<CR>
    nnoremap <leader>gc :Gcommit %<CR>
    nnoremap <leader>gd :Gvdiffsplit<CR>
    nnoremap <leader>gl :Gclog<CR>
    nnoremap <leader>gb :Git blame<CR>
    nnoremap <leader>gf :Git fetch<CR>
    nnoremap <leader>gps :Git push<CR>
    nnoremap <leader>gpl :Git pull<CR>
augroup END
" Fugitive end }}}
" Vim syntax, filetype, indents, etc
Plug 'https://github.com/tpope/vim-git'
" Enable GitHub features in fugitive
Plug 'https://github.com/tpope/vim-rhubarb'
" vim-signify --- {{{
Plug 'https://github.com/mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
" vim-signify end }}}
" vim-twiggy --- {{{
Plug 'https://github.com/sodapopcan/vim-twiggy'
nnoremap <leader>tw :Twiggy<cr>
nnoremap <leader>TW :Twiggy<space>
" vim-twiggy end }}}
" committia.vim --- {{{
Plug 'https://github.com/rhysd/committia.vim'
let g:committia_open_only_vim_starting = 1
" committia.vim end }}}
" Git end }}}
" Display --- {{{
" vim-crystalline --- {{{
Plug 'https://github.com/rbong/vim-crystalline'
function! StatusLine(current, width) abort
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  let l:s .= ObsessionStatus() . ' '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' ⎇ %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}%{&ft} '
    let l:s .= crystalline#left_mode_sep('')
    if a:width > 80
        let l:s .= ' 0x%B %c:%l/%L [%{&enc} %{&ff}] '
    else
        let l:s .= ' '
    endif
  endif

  return l:s
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'default'
" vim-crystalline end }}}
" Vimade --- {{{
Plug 'https://github.com/TaDaa/vimade',                             {'on': 'VimadeEnable'}
let g:vimade = {
            \'fadelevel': 0.6,
            \'checkinterval': 100,
            \'enablefocusfading': 1
            \}
augroup vimade
    autocmd!
    autocmd WinNew,BufNew * ++once if !exists('g:vimade_loaded') |
        \execute 'VimadeEnable' | endif
    autocmd FocusLost * ++once if !exists('g:vimade_loaded') |
        \execute 'VimadeEnable' |
        \call vimade#FocusLost() | endif
augroup END
" Vimade end }}}
" listtoggle --- {{{
Plug 'https://github.com/valloric/listtoggle'
let g:lt_location_list_toggle_map = '<leader>ll'
let g:lt_quickfix_list_toggle_map = '<leader>lq'
" listtoggle end }}}

" Better display of whitespace - adds :StripWhitespace too
Plug 'https://github.com/ntpeters/vim-better-whitespace'

" vim-numbertoggle --- {{{
Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber
nnoremap <silent> <leader>1 :set relativenumber!<cr>
nnoremap <silent> <leader>2 :set nonumber!<cr>:set norelativenumber!<cr>
" vim-numbertoggle end }}}

" Easier/better handling of in-file splits
Plug 'https://github.com/wellle/visual-split.vim'

Plug 'https://github.com/machakann/vim-highlightedyank'

" trouble.nvim --- {{{
Plug 'https://github.com/folke/trouble.nvim'
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
" }}}
" Display end }}}
" Tmux --- {{{
" Plugin: vimux --- {{{
Plug 'https://github.com/preservim/vimux'
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>
nnoremap <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>
" vimux end }}}
" - allow window nav to work across non-vim tmux panes (needs tmux config too)
Plug 'https://github.com/christoomey/vim-tmux-navigator'
" vim-tmux-focus-events
Plug 'https://github.com/tmux-plugins/vim-tmux-focus-events'
nnoremap <leader>z :call system("tmux resize-pane -Z")<CR>
" Tmux end }}}
" Filetypes/file formats --- {{{
" vimwiki --- {{{
Plug 'https://github.com/vimwiki/vimwiki'
let WIKI_BASE_DIR = '~/Library/Mobile\ Documents/com~apple~CloudDocs/vimwiki'
let wiki_1 = {}
let wiki_1.path = WIKI_BASE_DIR . '/vimwiki/'
let wiki_1.path_html = WIKI_BASE_DIR . '/vimwiki_html/'
let wiki_1.nested_syntaxes = {'python': 'python', 'sh': 'sh'}
let wiki_1.ext = '.md'
let wiki_1.folding = 'syntax'
let wiki_1.syntax = 'markdown'
let wiki_1.ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
let g:vimwiki_list = [wiki_1]
let g:vimwiki_markdown_ext_link = 1  " add .md to links, for other markdown processors
let g:vimwiki_global_ext = 0  " turn off temporary wikis
" vimwiki end }}}
" Python --- {{{
Plug 'https://github.com/kalekundert/vim-coiled-snake',             {'for': 'python'}
Plug 'https://github.com/Vimjas/vim-python-pep8-indent',            {'for': 'python'}
" Python  end }}}
" Django --- {{{
Plug 'https://github.com/vim-scripts/django.vim',                   {'for': 'django'}
Plug 'https://github.com/lieryan/django-plus.vim',                  {'for': 'django'}
" Django end }}}
" Markdown --- {{{
Plug 'https://github.com/gabrielelana/vim-markdown'
" Plugin: vim-table-mode --- {{{
Plug 'https://github.com/dhruvasagar/vim-table-mode'
let g:table_mode_corner='|'
" vim-table-mode end }}}
" Markdown end }}}
" Better JSON
Plug 'https://github.com/tpope/vim-jdaddy',                         {'for': ['javascript', 'json']}
" Terraform --- {{{
" Plug 'https://github.com/juliosueiras/vim-terraform-completion',    {'for': 'terraform'}
Plug 'https://github.com/hashivim/vim-terraform',                   {'for': 'terraform'}
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
" Terraform end }}}
" Tmux.conf syntax
Plug 'https://github.com/tmux-plugins/vim-tmux',                    {'for': 'tmux'}
" Nginx
Plug 'https://github.com/chr4/nginx.vim',                           {'for': 'nginx'}
" Jinja2
Plug 'https://github.com/Glench/Vim-Jinja2-Syntax',                 {'for': 'jinja2'}
" Filetypes/file formats end }}}
" Text objects --- {{{
" Use 'ia'/'aa' for arguments,
" or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
Plug 'https://github.com/wellle/targets.vim'
" Add af/if for functions, ac/ic for classes, ]m, ]M, [m, [M for moving
Plug 'https://github.com/jeetsukumaran/vim-pythonsense'
" - provides 'i' indent object (e.g. 'vai')
Plug 'https://github.com/michaeljsmith/vim-indent-object'
" dependency for vim-textobj-line
Plug 'https://github.com/kana/vim-textobj-user'
" - provides al/il
Plug 'https://github.com/kana/vim-textobj-line'
" Text objects end }}}
" Search --- {{{
" vim-asterisk ---------------------------------------------------- {{{
Plug 'https://github.com/haya14busa/vim-asterisk'
Plug 'https://github.com/qxxxb/vim-searchhi'
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)<Plug>(searchhi-update)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)<Plug>(searchhi-update)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)<Plug>(searchhi-update)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)<Plug>(searchhi-update)
let g:asterisk#keeppos = 1
" vim-asterisk end }}}
" Search end }}}
Plug 'https://github.com/dstein64/vim-startuptime'
call plug#end()
" Plugins end }}}
" Treesitter config --- {{{
" This must be outside the vim-plug config section
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    --   disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
}
EOF
" Treesitter config end --- }}}
" LSP config --- {{{
nnoremap gD :lua vim.lsp.buf.declaration()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <space>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <space>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <space>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <space>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <space>rn :lua vim.lsp.buf.rename()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <space>e :lua vim.diagnostic.open_float()<CR>
nnoremap [d :lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.diagnostic.goto_next()<CR>
nnoremap <space>q :lua vim.diagnostic.set_loclist()<CR>
lua <<EO_LSP_CONFIG
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-installer
 local lsp_installer = require "nvim-lsp-installer"

local function on_attach(client, bufnr)
  -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ["pylsp"] = function()
      default_opts.settings = {
        plugins = {
          pylint = {
            enable = true,
          },
        }
      }
    end,
  }

  -- Use the server's custom settings, if they exist, otherwise default to the default options
  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require "vim.lsp.protocol".CompletionItemKind = {
  "  (text)",
  "  (method)",
  "  (fun)",
  "  (constructor)",
  "ﰠ  (field)",
  " (var)",
  "ﴯ  (class)",
  "  (interface)",
  "  (module)",
  "ﰠ  (property)",
  "塞 (unit)",
  "  (value)",
  "  (enum)",
  "  (keyword)",
  "  (snippet)",
  "  (color)",
  "  (file)",
  "  (reference)",
  "  (folder)",
  "  (enum-member)",
  "  (constant)",
  "פּ  (struct)",
  "  (event)",
  "  (operator)",
  "   (type-param)"
}

EO_LSP_CONFIG

" Disable LSP diagnostics, so that ALE does that instead
augroup disable_lsp_diagnostics
    autocmd!
    autocmd BufEnter * lua vim.diagnostic.disable()
augroup END
" LSP config end --- }}}
" Completion config --- {{{
lua << EOCMP
require'luasnip'.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
})
require("luasnip.loaders.from_vscode").load()
local luasnip = require('luasnip')
local lspkind = require('lspkind')
-- local compare = require('cmp.config.compare')
-- local types = require('cmp.types')
local cmp = require('cmp')

cmp.setup({
   snippet = {
   	expand = function(args)
   		require("luasnip").lsp_expand(args.body)
   	end,
    },
     mapping = {
       ["<Tab>"] = cmp.mapping(
         function(fallback)
           if cmp.visible() then
             cmp.select_next_item()
           elseif luasnip.expand_or_jumpable() then
             luasnip.expand_or_jump()
           else
             fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
           end
         end,
         {"i", "s"}
       ),
       ["<S-Tab>"] = cmp.mapping(
         function(fallback)
           if cmp.visible() then
             cmp.select_prev_item()
           elseif luasnip.jumpable(-1) then
             luasnip.jump(-1)
           else
             fallback()
           end
         end,
         {"i", "s"}
       ),
   	   ["<C-e>"] = cmp.mapping.close(),
       ["<cr>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = false
       })
   },
   formatting = {
     format = lspkind.cmp_format({with_text = true, maxwidth = 50})
   },
   sources = {
     { name = 'nvim_lsp' },
     { name = 'luasnip' },
     { name = 'buffer' },
     { name = 'path' },
   },
})

-- nvim_cmp_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

EOCMP
" Completion config end --- }}}
" Trouble config --- {{{
lua << EOTROUBLE
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOTROUBLE
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" Trouble config end --- }}}
" Comment.nvim config --- {{{
lua require('Comment').setup()
" Comment.nvim config end --- }}}
" vim-sandwich config --- {{{
runtime macros/sandwich/keymap/surround.vim
" vim-sandwich config end --- }}}
" Settings --- {{{
scriptencoding utf-8
set backupcopy=yes              " using 'auto'/'no' may cause file-watching programs to miss changes
set undolevels=10000            " Keep lots of undo
set lazyredraw                  " Set lazy redraw, to speed up macros and the like
set showmatch                   " Show matching bracket
set matchtime=3                 " (for only 0.3s)
set confirm                     " Get confirmation before we do anything stupid
set whichwrap+=<,>,[,],h,l      " <left> and <right> move over line endings
set matchpairs+=<:>             " Match angle-brackets as well by default
set linebreak                   " Break lines at a sensible place
set title                       " Set descriptive window/terminal title
set printoptions=paper:A4       " (even though almost all prints go to PDF anyway)
set splitright                  " When splitting vertically, split to the right
set splitbelow                  " When splitting horizontally, split below
set scrolloff=5                 " Minimum no. of lines visible above/below the cursor when scrolling
set sidescrolloff=5             " Minimum no. of columns visible to the left/right of cursor when scrolling
set nomodeline                  " Disallow modelines (for security reasons)
set autowrite                   " Write file before some commands
set wildmode=longest:full,full  " Complete the next full match
set virtualedit=all             " Allow the cursor to move to 'invalid' places
set cmdheight=2                 " Avoid 'Press Enter' messages
set fillchars=diff:⣿,vert:│     " Have different vertical splits for diffs
set breakindent                 " indent wrapped lines
set noshowmode                  " vim-crystalline shows this for us
set nrformats=hex               " Ignore octal/binary for incrementing/decrementing numbers
set formatoptions+=n            " Recognize numbered lists
set signcolumn=yes:1            " always display signs, allocate 1 column for doing so
set completeopt=menu,menuone,noselect

set spellfile=~/.config/nvim/custom-dictionary.utf-8.add

" display --- {{{
set display=lastline            " Show as much of last line as possible
set display+=msgsep             " ... don't scroll the entire screen for long messages
set display+=uhex               " ... show unprintables as hex
" display end }}}
" sessionoptions --- {{{
set sessionoptions+=winpos      " Save window positions as well
set sessionoptions+=resize      " ... save window sizes as well
" sessionoptions end }}}
" diffopt --- {{{
set diffopt=internal            " use the internal diff library
set diffopt+=filler             " show filler lines
set diffopt+=iwhiteall          " ignore whitespace
set diffopt+=hiddenoff          " don't use diff mode for a buffer when it becomes hidden
set diffopt+=vertical           " show diffs vertically
set diffopt+=indent-heuristic   " use indent heuristic for diff
" diffopt end }}}
" timeouts --- {{{
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeoutlen=10
" timeouts end }}}
" mouse --- {{{
set mouse=a           " Enable the mouse for all modes
set mousemodel=popup  " Use popup menu for right mouse button
" mouse end }}}
" shada --- {{{
set shada+='1000  " Keep marks for N files
set shada+=<1000  " Keep N lines for each register
" shada end }}}
" clipboard --- {{{
set clipboard+=unnamedplus
" clipboard end }}}

" Settings end }}}
" Colors --- {{{
set termguicolors
if $ITERM_PROFILE ==# 'Light'
    colorscheme PaperColor
    set background=light
else
    colorscheme srcery
    set background=dark
endif
syntax enable
set colorcolumn=80
" Colors end }}}
" Tabs --- {{{
" For an explanation of the 'tabs vs spaces' used below, see
" <http://www.jwz.org/doc/tabs-vs-spaces.html>
set shiftwidth=4                " # spaces for autoindent steps
set shiftround                  " Always round to a multiple of 'shiftwidth'
set tabstop=4                   " Tabs = 4 spaces, but 'expandtab' *must* be set
set softtabstop=4               " # spaces that a tab counts for
set expandtab                   " Turn all tabs to spaces on save
filetype plugin indent on
" Tabs end }}}
" Searching --- {{{
set ignorecase " Ignore case when searching
set infercase  " Make completions smarter about cases
set smartcase  " Override 'ignorecase' when needed

augroup nohighlight
    autocmd!
    autocmd VimEnter * nohls
augroup END

nnoremap ,, :nohls<CR>

" Use tab and shift-tab to move between matches while in search ('/') mode
cnoremap <expr>  <tab>    getcmdtype() =~ '[?/]' ? '<c-g>' : feedkeys('<tab>', 'int')[1]
cnoremap <expr>  <s-tab>  getcmdtype() =~ '[?/]' ? '<c-t>' : feedkeys('<s-tab>', 'int')[1]

" }}}
" Command window --- {{{
" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
command! -bang Wn wn<bang>
command! -bang WN wn<bang>
command! -bang Xa xa<bang>
command! -bang XA xa<bang>

augroup command_window
    autocmd!
    " have <Ctrl-C> leave cmdline-window
    autocmd CmdwinEnter * nnoremap <buffer> <C-c> :q\|echo ""<cr>
    autocmd CmdwinEnter * inoremap <buffer> <C-c> <esc>:q\|echo ""<cr>
    " start command line window in insert mode and no line numbers
    autocmd CmdwinEnter * startinsert
    autocmd CmdwinEnter * set nonumber
augroup END

" Command window end }}}
" Help --- {{{
" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>
" Help end }}}
" Folding --- {{{
" The following open closed folds
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" Default to opening all folds
set foldlevelstart=99

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
" Folding end }}}
" File loading --- {{{
augroup vimStartup
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END

set fileformats=unix,dos,mac

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
""  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*
set wildignore+=*.pdf,*.zip,*.so                 " binaries
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX nonsense
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc,*.pyo                      " Python byte code

" File loading end }}}
" Undo --- {{{
" Trailing double slashes on directory names below cause Vim to save the
" full path to each file, but with slashes escaped - means we can have
" backup/undo files with the same names in multiple directories and keep
" them distinct
set backupdir=~/.local/share/nvim/backup//
set undodir=~/.local/share/nvim/undo//
set undofile
set noswapfile
set updatetime=500 " Write swap files after 0.5 seconds of inactivity.
" Drop an undo breakpoint so I can recover from insert-mode ctrl-w's
inoremap <c-w> <c-g>u<c-w>
" ...and do the same for punctuation
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap : :<c-g>u

"Meaningful backup name, ex: filename@2015-04-05.14:59
augroup named_backups
    autocmd!
    autocmd BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
augroup END

" Undo end }}}
" Display options --- {{{
" Use better looking listchars
set listchars=tab:»\ ,extends:›,precedes:‹,trail:·,nbsp:␣,eol:↲,conceal:┊
let &showbreak = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines

" Resize splits when the window is resized
augroup resized
    autocmd!
    au VimResized * exe "normal! \<c-w>="
augroup END

if &diff
    "I'm only interested in diff colours
    syntax off
endif

" https://github.com/khuedoan/dotfiles/blob/97d5d7bb4f00374a19beb50eaa75a83a7d570b06/.vimrc#L48
" Change cursor shape in different modes (see :help cursor-shape)
let &t_EI = "\033[2 q" " NORMAL  █
let &t_SI = "\033[5 q" " INSERT  |

" Display options end }}}
" Mappings --- {{{
" Swap the behaviour of j/k with gj/gk - i.e. j/k always move by screenlines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Add 'more than 5 lines' jumps to the jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" <leader>cd      cd to the directory of the current buffer
nnoremap <leader>cd :lcd %:h<CR>

" Moves the character under the cursor to the end of the line.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Quickly select text you just pasted
noremap gV `[v`]

" Move to paragraph lines, not the spaces between them
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

" Use <tab> to move between windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" Don't select the end of line with '$' - I almost always cursor left when
" doing this
nmap $ g_

" Increment/decrement the selection as an ordered list
vnoremap + g<C-a>gv
vnoremap - g<C-x>gv

" Try [twf](https://github.com/wvanlint/twf)
function! TwfExit(path)
  function! TwfExitClosure(job_id, data, event) closure
    bd!
    try
      let out = filereadable(a:path) ? readfile(a:path) : []
    finally
      silent! call delete(a:path)
    endtry
    if !empty(out)
      execute 'edit! ' . out[0]
    endif
  endfunction
  return funcref('TwfExitClosure')
endfunction

function! Twf()
  let temp = tempname()
  call termopen('twf ' . @% . ' > ' . temp, { 'on_exit': TwfExit(temp) })
  startinsert
endfunction

nnoremap <silent> <leader>tv :call Twf()<CR>

" Try using Q as @q
nnoremap Q @q

" Try adding an 'edit register' mapping - type 'cq' followed by the register
" to edit
nnoremap <expr> cq call({r-> ":\<c-u>let @".r." = \<c-r>\<c-r>=string(getreg('".r."'))\<cr>\<c-f>\<left>" }, [nr2char(getchar())])

" Use gs/gS for global/selection search and replaces
nnoremap gs :%s/
xnoremap gs :s/
nnoremap gS :%S/
xnoremap gS :S/

" Get out of diff
nnoremap <silent> <c-w><c-o> :diffoff!<bar>only<cr>
nnoremap <silent> <c-w>o :diffoff!<bar>only<cr>

" Start `cgn` with the word under the cursor
nmap cg* *Ncgn

" Formatting --- {{{
" gq wrapper that:
" - tries its best at keeping the cursor in place
" - tries to handle formatter errors
function! Format(type, ...)
    normal! gggqG
    if v:shell_error > 0
        silent undo
        redraw
        echomsg 'formatprg "' . &formatprg . '" exited with status ' . v:shell_error
    endif
    call winrestview(w:gqview)
    unlet w:gqview
endfunction
nmap <silent> gq :let w:gqview = winsaveview()<CR>:set opfunc=Format<CR>g@<CR>

" Formatting end }}}
" Compiling --- {{{
nnoremap <leader>cc :w<CR>:copen 6<CR><C-w>p:make<CR>
nnoremap <leader>co :copen 6<CR>
nnoremap <leader>cl :cclose<CR>
" Compiling end }}}

" Saving --- {{{
" Save normal buffers on <CR> - use `:update` to only save when modified -
" also turn off search highlighting
nnoremap <silent><expr> <CR> empty(&buftype) ? ":nohls<CR> \| :update\<CR>" : ":nohls<CR>\<CR>"
" Saving end }}}

" Buffers --- {{{
set wildcharm=<tab>
" Buffers end }}}

" Windows --- {{{
" Tmux-like split panes navigation
noremap <C-W>\| :vsplit<CR><C-W>l
noremap <C-W>- :split<CR><C-W>j
noremap <C-W><C-W> <C-W>w
" Windows end }}}

" Lines --- {{{
" Keep the cursor centred when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep the cursor in place while joining lines using 'J'
nnoremap J mzJ`z
" Join lines in insert mode
inoremap <C-j> <C-o>J
" Lines end }}}
" Mappings end }}}
" Arrow keys --- {{{
function SetArrowKeys()
    " Repurpose arrow keys to move lines
    " Arrow key remapping:
    " Up/Dn = move line up/dn
    " Left/Right = indent/unindent
    " Normal mode
    nnoremap <silent> <buffer> <Left> <<
    nnoremap <silent> <buffer> <Right> >>
    nnoremap <silent> <buffer> <Up>   :<C-u>silent move-2<CR>:silent! ==<CR>
    nnoremap <silent> <buffer> <Down> :<C-u>silent move+<CR>:silent! ==<CR>

    " Visual mode
    vnoremap <silent> <buffer> <Left> <gv
    vnoremap <silent> <buffer> <Right> >gv
    vnoremap <silent> <buffer> <Up>   :move-2<CR>gv=gv
    vnoremap <silent> <buffer> <Down> :move'>+<CR>gv=gv

    " Insert mode
    inoremap <silent> <buffer> <Left> <C-D>
    inoremap <silent> <buffer> <Right> <C-T>
endfunction

augroup arrowkeys
    autocmd!
    autocmd BufNewFile,Bufread * call SetArrowKeys()
augroup END
" Arrow keys end }}}
" Vim editing --- {{{
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>V :vsplit $MYVIMRC<cr>

augroup VimFiles
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

" automatically source the init.vim file if I change it
" the bang (!) forces it to overwrite this command rather than stack it
augroup autosourcevimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END
" Vim editing end }}}
" Autocommands --- {{{
" Makefile settings --- {{{
" Make the tab key do actual tab characters for makefiles.
augroup makefile
    autocmd!
    autocmd BufNewFile,Bufread *akefile call <SID>MakefileSettings()

    " Settings for Makefile-like things
    function! s:MakefileSettings() abort
        set noexpandtab " don't use spaces to indent
        set nosmarttab  " don't ever use spaces, not even at line beginnings
    endfunction

    autocmd QuickFixCmdPost make cwindow
augroup END
" Makefile settings end }}}

" Plugin window settings --- {{{
augroup plugins
    autocmd FileType Plugins map <buffer> q :q<cr>
augroup END
" Plugin window settings end }}}

" Autocommands end }}}
