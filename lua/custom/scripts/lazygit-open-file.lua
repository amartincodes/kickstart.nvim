local special_filetypes = {
  'neo-tree',
  'neo-tree-popup',
  'notify',
  'copilot-chat',
  'TelescopePrompt',
  'snacks_picker_input',
  'snacks_picker_list',
}

local special_buftypes = { 'terminal', 'quickfix', 'nofile', 'help', 'prompt' }

local function is_main_window(win)
  local config = vim.api.nvim_win_get_config(win)
  if config.relative ~= '' then
    return false
  end

  local buf = vim.api.nvim_win_get_buf(win)
  local buftype = vim.api.nvim_get_option_value('buftype', { buf = buf })
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })

  return not vim.tbl_contains(special_filetypes, filetype) and not vim.tbl_contains(special_buftypes, buftype)
end

-- Helper function to pick a window if multiple windows are open
local function pick_window_and_edit(file_path, line)
  local main_wins = vim.tbl_filter(is_main_window, vim.api.nvim_list_wins())
  local target_win

  if #main_wins > 1 then
    local picker = require 'window-picker'
    target_win = picker.pick_window {
      filter_func = function(window_ids)
        return vim.tbl_filter(is_main_window, window_ids)
      end,
      filter_rules = {
        include_current_win = true,
        autoselect_one = false,
      },
    }

    if not target_win then
      return
    end
  else
    target_win = main_wins[1] or vim.api.nvim_get_current_win()
  end

  vim.api.nvim_set_current_win(target_win)
  vim.cmd.edit(vim.fn.fnameescape(file_path))

  if line then
    vim.cmd(tostring(line))
  end
end

function EditLineFromLazygit(file_path, line)
  local path = vim.fn.expand '%:p'

  -- If already viewing the file, just jump to the line
  if path == file_path then
    vim.cmd(tostring(line))
  else
    pick_window_and_edit(file_path, line)
  end
end

function EditFromLazygit(file_path)
  local path = vim.fn.expand '%:p'

  -- If already viewing the file, do nothing
  if path == file_path then
    return
  else
    pick_window_and_edit(file_path)
  end
end

-- NOTE: Add this to .zshrc or .bashrc
-- alias nvim="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"

-- NOTE: Add this to lazygit config file (~/.config/lazygit/config.yml)
--
-- gui:
--   showCommandLog: false
--   showBottomLine: true
--   showFileTree: true
--   showRandomTip: false
--   nerdFontsVersion: "3"
--
-- keybinding:
--   universal:
--     nextTab: ']'
--     prevTab: '['
--
-- os:
--   editPreset: 'nvim-remote'
--   edit: "nvim --server $NVIM --remote-send '<cmd>close<cr><cmd>lua EditFromLazygit({{filename}})<CR>'"
--   editAtLine: "nvim --server $NVIM --remote-send '<cmd>close<CR><cmd>lua EditLineFromLazygit({{filename}},{{line}})<CR>'"

-- NOTE: We need to return a table to make Lazy happy
return {}
