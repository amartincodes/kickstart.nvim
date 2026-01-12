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
      local input = vim.fn.input 'YankBank get index: '
      if not input or input == '' then
        return
      end
      local i = tonumber(input)
      if i then
        local e = require('yankbank.api').get_entry(i)
        print(vim.inspect(e))
      else
        vim.notify('Invalid index', vim.log.levels.WARN)
      end
    end, { desc = '[Y]ank [B]ank [G]et entry', noremap = true })

    vim.keymap.set('n', '<leader>bYa', function()
      local text = vim.fn.input 'YankBank add text: '
      if not text or text == '' then
        return
      end
      local reg_type = vim.fn.input 'Register type (v/V/^V): '
      if not reg_type or reg_type == '' then
        return
      end
      require('yankbank.api').add_entry(text, reg_type)
    end, { desc = '[Y]ank [B]ank [A]dd entry', noremap = true })

    vim.keymap.set('n', '<leader>bYr', function()
      local input = vim.fn.input 'YankBank remove index: '
      if not input or input == '' then
        return
      end
      local i = tonumber(input)
      if i then
        require('yankbank.api').remove_entry(i)
      else
        vim.notify('Invalid index', vim.log.levels.WARN)
      end
    end, { desc = '[Y]ank [B]ank [R]emove entry', noremap = true })

    vim.keymap.set('n', '<leader>bYp', function()
      local input = vim.fn.input 'YankBank pin index: '
      if not input or input == '' then
        return
      end
      local i = tonumber(input)
      if i then
        require('yankbank.api').pin_entry(i)
      else
        vim.notify('Invalid index', vim.log.levels.WARN)
      end
    end, { desc = '[Y]ank [B]ank [P]in entry', noremap = true })

    vim.keymap.set('n', '<leader>bYu', function()
      local input = vim.fn.input 'YankBank unpin index: '
      if not input or input == '' then
        return
      end
      local i = tonumber(input)
      if i then
        require('yankbank.api').unpin_entry(i)
      else
        vim.notify('Invalid index', vim.log.levels.WARN)
      end
    end, { desc = '[Y]ank [B]ank [U]npin entry', noremap = true })
  end,
}
