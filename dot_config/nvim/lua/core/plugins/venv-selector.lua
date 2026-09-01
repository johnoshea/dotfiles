return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "ibhagwan/fzf-lua",
  },
  lazy = false,
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" },
  },
  ---@type venv-selector.Config
  opts = {
    options = {
      picker = "fzf-lua",
    },
  },
}
