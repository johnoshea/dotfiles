return {
  "tpope/vim-fugitive",
  config = function()
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

    keymap("n", "<leader>fs", ":Git<CR>", createOpts({ desc = "[f]ugitive [s]tatus" }))
    keymap("n", "<leader>fw", ":Gwrite<CR>", createOpts({ desc = "[f]ugitive [w]rite" }))
    keymap("n", "<leader>fc", ":Gcommit %<CR>", createOpts({ desc = "[f]ugitive [c]ommit" }))
    keymap("n", "<leader>fD", ":Git difftool<CR>", createOpts({ desc = "[f]ugitive [D]ifftool" }))
    keymap("n", "<leader>fv", ":Gvdiffsplit<CR>", createOpts({ desc = "[f]ugitive [v] Gvdiffsplit" }))
    keymap("n", "<leader>fd", ":Gdiffsplit<CR>", createOpts({ desc = "[f]ugitive [d]iffsplit" }))
    keymap("n", "<leader>fo", ":windo diffoff<CR> | :only<CR>", createOpts({ desc = "[f]ugitive diff[o]ff" }))
    keymap("n", "<leader>fM", ":Git mergetool<CR>", createOpts({ desc = "[f]ugitive [M]ergetool" }))
    keymap("n", "<leader>fl", ":Gclog<CR>", createOpts({ desc = "[f]ugitive [l]og" }))
    keymap("n", "<leader>f1", ":Git log --oneline<CR>", createOpts({ desc = "[f]ugitive [1] log oneline" }))
    keymap("n", "<leader>fb", ":Git blame<CR>", createOpts({ desc = "[f]ugitive [b]lame" }))
    keymap("n", "<leader>ff", ":Git fetch<CR>", createOpts({ desc = "[f]ugitive [f]etch" }))
    keymap("n", "<leader>fp", ":Git push<CR>", createOpts({ desc = "[f]ugitive [p]ush" }))
    keymap("n", "<leader>fP", ":Git pull<CR>", createOpts({ desc = "[f]ugitive [P]ull" }))
    keymap("n", "<leader>ft", ":Twiggy<space>", createOpts({ desc = "[f]ugitive [t]wiggy <space>" }))
    keymap("n", "<leader>fT", ":Twiggy<CR>", createOpts({ desc = "[f]ugitive [T]wiggy" }))
  end,
}
