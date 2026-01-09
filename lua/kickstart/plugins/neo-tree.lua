-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>ee', ':Neotree toggle<CR>', desc = 'Toggle file tree', silent = true },
    { '<leader>ef', ':Neotree focus<CR>', desc = 'Focus file tree', silent = true },
    { '<leader>er', ':Neotree reveal<CR>', desc = 'Reveal current file in tree', silent = true },
    {
      '<leader>ew',
      function()
        local neo_tree_wins = vim.fn.win_findbuf(vim.fn.bufnr 'neo-tree filesystem')
        if #neo_tree_wins > 0 then
          local win = neo_tree_wins[1]
          local cur_width = vim.api.nvim_win_get_width(win)
          if cur_width == 60 then
            vim.api.nvim_win_set_width(win, 30)
          else
            vim.api.nvim_win_set_width(win, 60)
          end
        end
      end,
      desc = 'Toggle tree width between 60 and 30',
      silent = true,
    },
    {
      '<leader>eW',
      function()
        local neo_tree_wins = vim.fn.win_findbuf(vim.fn.bufnr 'neo-tree filesystem')
        if #neo_tree_wins > 0 then
          local win = neo_tree_wins[1]
          local cur_width = vim.api.nvim_win_get_width(win)
          if cur_width == 120 then
            vim.api.nvim_win_set_width(win, 30)
          else
            vim.api.nvim_win_set_width(win, 120)
          end
        end
      end,
      desc = 'Toggle tree width between 120 and 30',
      silent = true,
    },
    { '\\', ':Neotree toggle<CR>', desc = 'Toggle file tree', silent = true },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    default_component_configs = {
      indent = {
        padding = 0,
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        width = 30,
        position = 'left',
        mappings = {
          ['\\'] = 'close_window',
          ['<cr>'] = 'open_with_window_picker',
          ['/'] = 'none',
          ['F'] = 'fuzzy_finder',
          ['v'] = 'open_vsplit',
          ['s'] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()

            -- If it's a file, get its parent directory
            if node.type == 'file' then
              path = vim.fn.fnamemodify(path, ':h')
            end

            -- Open telescope live_grep with the selected directory
            require('telescope.builtin').live_grep {
              search_dirs = { path },
              prompt_title = 'Grep in ' .. vim.fn.fnamemodify(path, ':~:.'),
            }
          end,
        },
      },
      window_picker = {
        enable = true,
      },
    },
  },
}
