return {
  'amartincodes/piega',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('piega').setup {
      -- your configuration here (optional)
    }
  end,
}
