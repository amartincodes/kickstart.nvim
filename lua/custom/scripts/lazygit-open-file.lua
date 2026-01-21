function EditLineFromLazygit(file_path, line)
  local path = vim.fn.expand '%:p'
  if path == file_path then
    vim.cmd(tostring(line))
  else
    vim.cmd('e ' .. file_path)
    vim.cmd(tostring(line))
  end
end

function EditFromLazygit(file_path)
  local path = vim.fn.expand '%:p'
  if path == file_path then
    return
  else
    vim.cmd('e ' .. file_path)
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
