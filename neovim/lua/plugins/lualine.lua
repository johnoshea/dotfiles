return {
    "nvim-lualine/lualine.nvim",
	 	dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = false,
          theme = "dracula",
          -- component_separators = "|",
          -- section_separators = "",
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'progress'},
          lualine_y = {'encoding', 'fileformat', 'filetype'},
          lualine_z = {'location'}
        },
      }
    end,
}
