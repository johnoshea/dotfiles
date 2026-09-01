return {
  "MagicDuck/grug-far.nvim",
  config = function()
    -- ripgrep is the default engine; `<localleader>e` swaps to ast-grep in the buffer.
    require("grug-far").setup({})
    vim.keymap.set("n", "<leader>gf", "<cmd>GrugFar<CR>", { desc = "Open [g]rug-[f]ar" })
  end,
}
