return {
  'amartincodes/multilinea',
  event = 'BufReadPost',
  opts = {},
  config = function(_, opts)
    require('multilinea').setup(opts)
  end,
}
