return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
    { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    -- See Configuration section for options
  },
  config = function()
    require('CopilotChat').setup {
      -- default copilot model is 'claude-opus-4.5'
      model = 'claude-opus-4.5',
      selection = 'visual',
      window = {
        title = 'Clanker Chat',
      },
      headers = {
        user = '👤 You',
        assistant = '🤖 Clanker',
        tool = '🔧 Tool',
      },
    }
    -- CopilotChat keybindings
    vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Toggle CopilotChat', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>cx', ':CopilotChatStop<CR>', { desc = 'CopilotChat [X] Stop', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>cr', ':CopilotChatReset<CR>', { desc = '[R]eset CopilotChat', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>c?', ':help copilotchat<CR>', { desc = 'CopilotChat [H]elp', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>cm', ':CopilotChatModels<CR>', { desc = 'CopilotChat [M]odels', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ca', ':CopilotChatAgents<CR>', { desc = 'CopilotChat [A]gents', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'CopilotChat [E]xplain', noremap = true, silent = true })
  end,
  -- See Commands section for default commands if you want to lazy load on them
}
