return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    -- Keymaps for Harpoon
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd File' })
    vim.keymap.set('n', '<leader>hr', function()
      harpoon:list():remove()
    end, { desc = '[H]arpoon [R]emove File' })
    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [H]arpoon List' })
    -- vim.keymap.set('n', '<leader>hf', function()
    --   harpoon:list():find()
    -- end, { desc = '[H]arpoon [F]ind File' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon [N]ext File' })
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon [P]revious File' })
    vim.keymap.set('n', '<leader>ht', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[H]arpoon [T]elescope' })
    vim.keymap.set('n', '<leader>h1', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon [1] Go to File' })
    vim.keymap.set('n', '<leader>h2', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon [2] Go to File' })
    vim.keymap.set('n', '<leader>h3', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon [3] Go to File' })
    vim.keymap.set('n', '<leader>h4', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon [4] Go to File' })
    vim.keymap.set('n', '<leader>h5', function()
      harpoon:list():select(5)
    end, { desc = '[H]arpoon [5] Go to File' })
    vim.keymap.set('n', '<leader>h6', function()
      harpoon:list():select(6)
    end, { desc = '[H]arpoon [6] Go to File' })
    vim.keymap.set('n', '<leader>h7', function()
      harpoon:list():select(7)
    end, { desc = '[H]arpoon [7] Go to File' })
    vim.keymap.set('n', '<leader>h8', function()
      harpoon:list():select(8)
    end, { desc = '[H]arpoon [8] Go to File' })
    vim.keymap.set('n', '<leader>h9', function()
      harpoon:list():select(9)
    end, { desc = '[H]arpoon [9] Go to File' })
    vim.keymap.set('n', '<leader>hc', function()
      harpoon:list():clear()
    end, { desc = '[H]arpoon [C]lear All Files' })
  end,
}
