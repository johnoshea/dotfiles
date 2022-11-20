local colorscheme = "kanagawa"

require('ayu').setup({
    overrides = {
        LineNr = { fg = '#998942' }
    }
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
