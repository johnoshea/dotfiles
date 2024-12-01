return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      engine = "astgrep",
    })
    vim.keymap.set("n", "<leader>gf", "<cmd>GrugFar<CR>", { desc = "Open [g]rug-[f]ar" })
  end,
}
