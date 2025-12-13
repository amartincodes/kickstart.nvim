-- https://github.com/s1n7ax/nvim-window-picker
-- Used for neo-tree to pick a window to open files into
return {
  's1n7ax/nvim-window-picker',
  version = '2.*',
  config = function()
    require('window-picker').setup {
      hint = 'floating-big-letter',
      selection_chars = 'FJKLDEGHIMN', -- Characters used for hints
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'copilot-chat' },
          -- if the buffer type is one of following, the window will be ignored
          buftype = { 'terminal', 'quickfix', 'nofile', 'help' },
        },
      },
    }
  end,
}
