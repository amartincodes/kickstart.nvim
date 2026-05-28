return {
  -- 'amartincodes/multilinea',
  dir = '~/Documents/projects/multilinea',
  event = 'BufReadPost',
  opts = {},
  config = function(_, opts)
    require('multilinea').setup(opts)
  end,
}
