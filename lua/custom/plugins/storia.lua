return {
  'amartincodes/storia',
  config = function()
    require('storia').setup {
      max_files = 10,
    }

    vim.keymap.set('n', '<leader>bs', function()
      require('storia').toggle()
    end, { desc = '[S]toria: Show recent files' })
    vim.keymap.set('n', '<leader>bc', function()
      require('storia').clear()
      print 'Storia: Cleared history'
    end, { desc = 'Storia: [C]lear working history' })
  end,
}
