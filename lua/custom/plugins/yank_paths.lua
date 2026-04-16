return {
  'folke/which-key.nvim',
  opts = function(_, opts)
    opts = opts or {}
    opts.spec = opts.spec or {}
    table.insert(opts.spec, { '<leader>y', group = '[Y]ank' })
  end,
  init = function()
    local function yank_text(value, label)
      if value == '' then
        vim.notify('No file in buffer', vim.log.levels.WARN)
        return
      end

      local ok = pcall(vim.fn.setreg, '+', value)
      if ok then
        vim.notify('Yanked ' .. label .. ': ' .. value, vim.log.levels.INFO)
        return
      end

      vim.fn.setreg('"', value)
      vim.notify('Clipboard unavailable. Yanked ' .. label .. ' to unnamed register', vim.log.levels.WARN)
    end

    vim.keymap.set('n', '<leader>yp', function()
      yank_text(vim.fn.expand '%:p', 'full path')
    end, { desc = '[Y]ank full [P]ath' })

    vim.keymap.set('n', '<leader>yf', function()
      yank_text(vim.fn.expand '%:t', 'filename')
    end, { desc = '[Y]ank [F]ilename' })
  end,
}
