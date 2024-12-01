return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<F5>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<F1>",
          accept_word = "<F6>",
          accept_line = "<F7>",
          next = "<F3>",
          prev = "<F4>",
          dismiss = "<F2>",
        },
      },
      filetypes = {
        yaml = false,
        toml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            -- disable for .env files
            return false
          end
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.secrets.*") then
            -- disable for .secrets files
            return false
          end
          return true
        end,
      },
    })
  end,
}
