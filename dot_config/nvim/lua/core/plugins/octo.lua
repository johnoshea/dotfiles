return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
    "echasnovski/mini.icons",
  },
  config = function()
    require("octo").setup({
      picker = "fzf-lua",
      ssh_aliases = { ["wordbank.github.com"] = "github.com" },
      gh_cmd = "/opt/homebrew/bin/gh",
    })
  end,
}
