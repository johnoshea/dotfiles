return {
  "janko-m/vim-test",
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

    vim.g.VimuxOrientation = "v"
    vim.g.VimuxHeight = "30"
    vim.g["test#strategy"] = {
      nearest = "vimux",
      file = "vimux",
      suite = "vimux",
    }
    vim.g["test#python#pytest#file_pattern"] = ".py"

    keymap("n", "<leader>ctf", "<CMD>TestFile<CR>", createOpts({ desc = "[C]ode [T]est [F]ile" }))
    keymap("n", "<leader>ctn", "<CMD>TestNearest<CR>", createOpts({ desc = "[C]ode [T]est [N]earest" }))
    keymap("n", "<leader>ctl", "<CMD>TestLast<CR>", createOpts({ desc = "[C]ode [T]est [L]ast" }))
    keymap("n", "<leader>ctv", "<CMD>TestVisit<CR>zz", createOpts({ desc = "[C]ode [T]est [V]isit" }))
    keymap("n", "<leader>cts", "<CMD>TestSuite<CR>", createOpts({ desc = "[C]ode [T]est [S]uite" }))
  end,
}
