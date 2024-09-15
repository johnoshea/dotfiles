-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/johno/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?.lua;/Users/johno/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?/init.lua;/Users/johno/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?.lua;/Users/johno/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/johno/.cache/nvim/packer_hererocks/2.1.1725453128/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  DidYouMean = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/DidYouMean",
    url = "https://github.com/EinfachToll/DidYouMean"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aider.nvim"] = {
    config = { "\27LJ\2\na\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\24auto_manage_context\1\21default_bindings\1\nsetup\naider\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/aider.nvim",
    url = "https://github.com/joshuavial/aider.nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nÅ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\b\0\0\6/\v/Users\t/opt\r/private\a~/\16~/Downloads\15~/Projects\1\0\2\14log_level\nerror\31auto_session_suppress_dirs\0\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bigfile.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/bigfile.nvim",
    url = "https://github.com/LunarVim/bigfile.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\n«\2\0\0\a\0\n\00056\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2'\3\a\0B\0\3\2\15\0\0\0X\1\2€+\0\1\0L\0\2\0006\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2'\3\b\0B\0\3\2\15\0\0\0X\1\2€+\0\1\0L\0\2\0006\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2'\3\t\0B\0\3\2\15\0\0\0X\1\2€+\0\1\0L\0\2\0+\0\2\0L\0\2\0\v^%*.md\17^%.secrets.*\r^%.env.*\22nvim_buf_get_name\bapi\rbasename\afs\bvim\nmatch\vstring“\4\1\0\5\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0005\4\v\0=\4\5\3=\3\f\0025\3\r\0003\4\14\0=\4\15\3=\3\16\2B\0\2\1K\0\1\0\14filetypes\ash\0\1\0\v\6.\1\tyaml\1\ttoml\1\rmarkdown\1\thelp\1\14gitcommit\1\14gitrebase\1\rhgcommit\1\bsvn\1\bcvs\1\ash\0\15suggestion\1\0\6\tnext\t<F3>\16accept_word\t<F6>\16accept_line\t<F7>\vaccept\t<F1>\tprev\t<F4>\fdismiss\t<F2>\1\0\4\fenabled\2\vkeymap\0\rdebounce\3K\17auto_trigger\2\npanel\1\0\2\14filetypes\0\15suggestion\0\vlayout\1\0\2\rposition\vbottom\nratio\4š³æÌ\t™³æþ\3\vkeymap\1\0\5\14jump_prev\a[[\frefresh\agr\14jump_next\a]]\vaccept\t<CR>\topen\t<F5>\1\0\4\fenabled\2\vkeymap\0\17auto_refresh\1\vlayout\0\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["definition-or-references.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/definition-or-references.nvim",
    url = "https://github.com/KostkaBrukowa/definition-or-references.nvim"
  },
  ["easydir.vim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/easydir.vim",
    url = "https://github.com/vim-scripts/easydir.vim"
  },
  embark = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/embark",
    url = "https://github.com/embark-theme/vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["git-messenger.vim"] = {
    config = { "\27LJ\2\nR\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vborder\vsingle$git_messenger_floating_win_opts\6g\bvim\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hbac.nvim"] = {
    config = { "\27LJ\2\n;\0\1\5\0\3\0\a6\1\0\0009\1\1\0019\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\20nvim_buf_delete\bapi\bvim’\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\18close_command\0\1\0\4\14threshold\3\n\18close_command\0\31close_buffers_with_windows\1\14autoclose\2\nsetup\thbac\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/hbac.nvim",
    url = "https://github.com/axkirillov/hbac.nvim"
  },
  ["hover.nvim"] = {
    config = { "\27LJ\2\n½\1\0\0\3\0\6\0\0166\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\1K\0\1\0\31hover.providers.dictionary\24hover.providers.man\28hover.providers.gh_user\23hover.providers.gh\24hover.providers.lsp\frequireƒ\4\1\0\a\0\24\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0006\4\0\0'\6\1\0B\4\2\0029\4\1\0045\5\15\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\16\0006\4\0\0'\6\1\0B\4\2\0029\4\17\0045\5\18\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\19\0006\4\0\0'\6\1\0B\4\2\0029\4\20\0045\5\21\0B\0\5\0016\0\n\0009\0\22\0+\1\2\0=\1\23\0K\0\1\0\19mousemoveevent\6o\1\0\1\tdesc\23hover.nvim (mouse)\16hover_mouse\16<MouseMove>\1\0\1\tdesc\24hover.nvim (select)\17hover_select\agK\1\0\1\tdesc\15hover.nvim\6K\6n\bset\vkeymap\bvim\20mouse_providers\1\2\0\0\bLSP\17preview_opts\1\0\1\vborder\vsingle\tinit\1\0\6\16mouse_delay\3è\a\19preview_window\1\ntitle\2\17preview_opts\0\tinit\0\20mouse_providers\0\0\nsetup\nhover\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/hover.nvim",
    url = "https://github.com/lewis6991/hover.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nð\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\3\23section_separators\0\ntheme\15catppuccin\18icons_enabled\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-update-all"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"mason-update-all has finished\nprintÃ\1\1\0\b\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0005\6\a\0003\a\b\0=\a\t\6B\3\3\0?\3\0\0B\0\2\1K\0\1\0\rcallback\0\1\0\2\fpattern\27MasonUpdateAllComplete\rcallback\0\tUser\24nvim_create_autocmd\bapi\bvim\nsetup\21mason-update-all\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/mason-update-all",
    url = "https://github.com/RubixDev/mason-update-all"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nginx.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/nginx.vim",
    url = "https://github.com/chr4/nginx.vim"
  },
  ["none-ls.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n^\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\1\4\0=\1\3\0K\0\1\0\vsingle\vborder\20default_options\25lspconfig.ui.windows\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÌ\2\0\0\a\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\15\0005\4\14\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\factions\14open_file\1\0\1\14open_file\0\1\0\1\17quit_on_open\2\ffilters\1\0\1\rdotfiles\2\rrenderer\1\0\1\16group_empty\2\tview\rmappings\tlist\1\0\1\tlist\0\1\0\2\vaction\vdir_up\bkey\6u\1\0\2\rmappings\0\nwidth\0032\1\0\3\tview\0\rrenderer\0\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n|\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16ssh_aliases\1\0\1\16ssh_aliases\0\1\0\1\24wordbank.github.com\15github.com\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-menufacture"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16menufacture\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/telescope-menufacture",
    url = "https://github.com/molecule-man/telescope-menufacture"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  treesj = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vtreesj\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["venv-selector.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tname\f.direnv\nsetup\18venv-selector\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/venv-selector.nvim",
    url = "https://github.com/linux-cultist/venv-selector.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-just"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-just",
    url = "https://github.com/NoahTheDuke/vim-just"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-mundo"] = {
    commands = { "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-numbertoggle",
    url = "https://github.com/jeffkreeftmeijer/vim-numbertoggle"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-pythonsense"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/vim-pythonsense",
    url = "https://github.com/jeetsukumaran/vim-pythonsense"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-table-mode"] = {
    config = { "\27LJ\2\n5\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6|\22table_mode_corner\6g\bvim\0" },
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/janko-m/vim-test"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment",
    url = "https://github.com/julian/vim-textobj-variable-segment"
  },
  ["vim-tmux"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/opt/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-twiggy"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-twiggy",
    url = "https://github.com/sodapopcan/vim-twiggy"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  vimux = {
    loaded = true,
    path = "/Users/johno/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/preservim/vimux"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: vim-table-mode
time([[Config for vim-table-mode]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6|\22table_mode_corner\6g\bvim\0", "config", "vim-table-mode")
time([[Config for vim-table-mode]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÌ\2\0\0\a\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\15\0005\4\14\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\factions\14open_file\1\0\1\14open_file\0\1\0\1\17quit_on_open\2\ffilters\1\0\1\rdotfiles\2\rrenderer\1\0\1\16group_empty\2\tview\rmappings\tlist\1\0\1\tlist\0\1\0\2\vaction\vdir_up\bkey\6u\1\0\2\rmappings\0\nwidth\0032\1\0\3\tview\0\rrenderer\0\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: aider.nvim
time([[Config for aider.nvim]], true)
try_loadstring("\27LJ\2\na\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\24auto_manage_context\1\21default_bindings\1\nsetup\naider\frequire\0", "config", "aider.nvim")
time([[Config for aider.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nÅ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\b\0\0\6/\v/Users\t/opt\r/private\a~/\16~/Downloads\15~/Projects\1\0\2\14log_level\nerror\31auto_session_suppress_dirs\0\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nð\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\23section_separators\1\0\2\nright\bî‚²\tleft\bî‚°\25component_separators\1\0\2\nright\bî‚³\tleft\bî‚±\1\0\3\23section_separators\0\ntheme\15catppuccin\18icons_enabled\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope-menufacture
time([[Config for telescope-menufacture]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16menufacture\19load_extension\14telescope\frequire\0", "config", "telescope-menufacture")
time([[Config for telescope-menufacture]], false)
-- Config for: hover.nvim
time([[Config for hover.nvim]], true)
try_loadstring("\27LJ\2\n½\1\0\0\3\0\6\0\0166\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\1K\0\1\0\31hover.providers.dictionary\24hover.providers.man\28hover.providers.gh_user\23hover.providers.gh\24hover.providers.lsp\frequireƒ\4\1\0\a\0\24\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0006\4\0\0'\6\1\0B\4\2\0029\4\1\0045\5\15\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\16\0006\4\0\0'\6\1\0B\4\2\0029\4\17\0045\5\18\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\19\0006\4\0\0'\6\1\0B\4\2\0029\4\20\0045\5\21\0B\0\5\0016\0\n\0009\0\22\0+\1\2\0=\1\23\0K\0\1\0\19mousemoveevent\6o\1\0\1\tdesc\23hover.nvim (mouse)\16hover_mouse\16<MouseMove>\1\0\1\tdesc\24hover.nvim (select)\17hover_select\agK\1\0\1\tdesc\15hover.nvim\6K\6n\bset\vkeymap\bvim\20mouse_providers\1\2\0\0\bLSP\17preview_opts\1\0\1\vborder\vsingle\tinit\1\0\6\16mouse_delay\3è\a\19preview_window\1\ntitle\2\17preview_opts\0\tinit\0\20mouse_providers\0\0\nsetup\nhover\frequire\0", "config", "hover.nvim")
time([[Config for hover.nvim]], false)
-- Config for: hbac.nvim
time([[Config for hbac.nvim]], true)
try_loadstring("\27LJ\2\n;\0\1\5\0\3\0\a6\1\0\0009\1\1\0019\1\2\1\18\3\0\0004\4\0\0B\1\3\1K\0\1\0\20nvim_buf_delete\bapi\bvim’\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\18close_command\0\1\0\4\14threshold\3\n\18close_command\0\31close_buffers_with_windows\1\14autoclose\2\nsetup\thbac\frequire\0", "config", "hbac.nvim")
time([[Config for hbac.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\5\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\1\4\0=\1\3\0K\0\1\0\vsingle\vborder\20default_options\25lspconfig.ui.windows\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16ssh_aliases\1\0\1\16ssh_aliases\0\1\0\1\24wordbank.github.com\15github.com\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: none-ls.nvim
time([[Config for none-ls.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fnull-ls\frequire\0", "config", "none-ls.nvim")
time([[Config for none-ls.nvim]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: git-messenger.vim
time([[Config for git-messenger.vim]], true)
try_loadstring("\27LJ\2\nR\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vborder\vsingle$git_messenger_floating_win_opts\6g\bvim\0", "config", "git-messenger.vim")
time([[Config for git-messenger.vim]], false)
-- Config for: mason-update-all
time([[Config for mason-update-all]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"mason-update-all has finished\nprintÃ\1\1\0\b\0\n\1\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0005\6\a\0003\a\b\0=\a\t\6B\3\3\0?\3\0\0B\0\2\1K\0\1\0\rcallback\0\1\0\2\fpattern\27MasonUpdateAllComplete\rcallback\0\tUser\24nvim_create_autocmd\bapi\bvim\nsetup\21mason-update-all\frequire\3€€À™\4\0", "config", "mason-update-all")
time([[Config for mason-update-all]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MundoToggle', function(cmdargs)
          require('packer.load')({'vim-mundo'}, { cmd = 'MundoToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-mundo'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MundoToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-pythonsense', 'vim-python-pep8-indent', 'venv-selector.nvim'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType nginx ++once lua require("packer.load")({'nginx.vim'}, { ft = "nginx" }, _G.packer_plugins)]]
vim.cmd [[au FileType tmux ++once lua require("packer.load")({'vim-tmux'}, { ft = "tmux" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/johno/.local/share/nvim/site/pack/packer/opt/nginx.vim/ftdetect/nginx.vim]], true)
vim.cmd [[source /Users/johno/.local/share/nvim/site/pack/packer/opt/nginx.vim/ftdetect/nginx.vim]]
time([[Sourcing ftdetect script at: /Users/johno/.local/share/nvim/site/pack/packer/opt/nginx.vim/ftdetect/nginx.vim]], false)
time([[Sourcing ftdetect script at: /Users/johno/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]], true)
vim.cmd [[source /Users/johno/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]]
time([[Sourcing ftdetect script at: /Users/johno/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]], false)
time([[Sourcing ftdetect script at: /Users/johno/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /Users/johno/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /Users/johno/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
