return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
