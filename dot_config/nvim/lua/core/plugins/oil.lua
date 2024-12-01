return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<Esc>"] = "actions.close",
      },
    })
    vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent directory" })
  end,
}
