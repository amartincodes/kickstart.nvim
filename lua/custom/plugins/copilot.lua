return {
  'github/copilot.vim',
  version = '*',
  lazy = false,
  config = function()
    -- Copilot is a code completion tool that uses AI to suggest code.
    -- It can be used in many languages, and it works best with LSP.
    --
    -- You can use the following keymaps to interact with Copilot:
    --  - <C-]> to accept the suggestion
    --  - <C-[> to dismiss the suggestion
    --  - <C-n> to cycle through suggestions
    --  - <C-p> to cycle backwards through suggestions
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-]>', 'copilot#Accept()', { expr = true, silent = true, replace_keycodes = false })
    -- toggle copilot
    vim.keymap.set('n', '<leader>cc', function()
      -- Query Copilot status and toggle accordingly
      local status = vim.fn['copilot#Enabled']()
      if status == 1 then
        vim.cmd 'Copilot disable'
        print 'Copilot disabled'
      else
        vim.cmd 'Copilot enable'
        print 'Copilot enabled'
      end
    end, { desc = '[C]opilot toggle', noremap = true, silent = true })
    -- Copilot panel
    vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { desc = '[C]opilot [P]anel', noremap = true, silent = true })
    -- Copilot version
    vim.keymap.set('n', '<leader>cv', ':Copilot version<CR>', { desc = '[C]opilot [V]ersion', noremap = true, silent = true })
    -- Copilot status
    vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = '[C]opilot [S]tatus', noremap = true, silent = true })
    -- Copilot config
    vim.keymap.set('n', '<leader>cC', ':Copilot config<CR>', { desc = '[C]opilot [C]onfig', noremap = true, silent = true })
    -- Copilot setup
    vim.keymap.set('n', '<leader>cS', ':Copilot setup<CR>', { desc = '[C]opilot [S]etup', noremap = true, silent = true })
    -- Copilot signout
    vim.keymap.set('n', '<leader>cl', ':Copilot signout<CR>', { desc = '[C]opilot [L]ogout', noremap = true, silent = true })
    -- Copilot disable
    vim.keymap.set('n', '<leader>cD', ':Copilot disable<CR>', { desc = '[C]opilot [D]isable', noremap = true, silent = true })
    -- Copilot enable
    vim.keymap.set('n', '<leader>cE', ':Copilot enable<CR>', { desc = '[C]opilot [E]nable', noremap = true, silent = true })
  end,
}
