return {
  'ptdewey/yankbank-nvim',
  lazy = false,
  dependencies = { 'kkharji/sqlite.lua' },
  cmd = { 'YankBank' },
  config = function()
    require('yankbank').setup {
      persist_type = 'sqlite',
    }
    -- map to '<leader>by'
    vim.keymap.set('n', '<leader>by', '<cmd>YankBank<CR>', { desc = '[Y]ank [B]ank', noremap = true })
    -- yankbank API keybinds
    vim.keymap.set('n', '<leader>bYg', function()
      local i = tonumber(vim.fn.input 'YankBank get index: ')
      if i then
        local e = require('yankbank.api').get_entry(i)
        print(vim.inspect(e))
      end
    end, { desc = '[Y]ank [B]ank [G]et entry', noremap = true })

    vim.keymap.set('n', '<leader>bYa', function()
      local text = vim.fn.input 'YankBank add text: '
      local reg_type = vim.fn.input 'Register type (v/V/^V): '
      require('yankbank.api').add_entry(text, reg_type)
    end, { desc = '[Y]ank [B]ank [A]dd entry', noremap = true })

    vim.keymap.set('n', '<leader>bYr', function()
      local i = tonumber(vim.fn.input 'YankBank remove index: ')
      if i then
        require('yankbank.api').remove_entry(i)
      end
    end, { desc = '[Y]ank [B]ank [R]emove entry', noremap = true })

    vim.keymap.set('n', '<leader>bYp', function()
      local i = tonumber(vim.fn.input 'YankBank pin index: ')
      if i then
        require('yankbank.api').pin_entry(i)
      end
    end, { desc = '[Y]ank [B]ank [P]in entry', noremap = true })

    vim.keymap.set('n', '<leader>bYu', function()
      local i = tonumber(vim.fn.input 'YankBank unpin index: ')
      if i then
        require('yankbank.api').unpin_entry(i)
      end
    end, { desc = '[Y]ank [B]ank [U]npin entry', noremap = true })
  end,
}
