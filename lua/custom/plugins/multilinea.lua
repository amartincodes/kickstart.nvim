return {
  dir = '/home/cubanmercury/Documents/projects/multilinea', -- Local development path
  event = 'BufReadPost',
  opts = {},
  config = function(_, opts)
    require('multilinea').setup(opts)
  end,
}
