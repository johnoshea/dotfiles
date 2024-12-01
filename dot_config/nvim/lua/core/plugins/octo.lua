return {
  "pwntester/octo.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "echasnovski/mini.icons",
  },
  config = function()
    require("octo").setup({
      ssh_aliases = { ["wordbank.github.com"] = "github.com" },
      gh_cmd = "/opt/homebrew/bin/gh",
    })
  end,
}
