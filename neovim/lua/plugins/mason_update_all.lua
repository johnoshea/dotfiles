return {
  'RubixDev/mason-update-all',
  config = function()
    require('mason-update-all').setup{
      vim.api.nvim_create_autocmd('User', {
      pattern = 'MasonUpdateAllComplete',
      callback = function()
          print('mason-update-all has finished')
      end,
      })
    }
  end
}
