return
{
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({})

      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for i, item in ipairs(harpoon_files.items) do
          local value = i .. " " .. item.value
          table.insert(file_paths, value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end
      vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "harpoon add" })
      vim.keymap.set("n", "<leader>;", function() harpoon:list():clear() end, { desc = "harpoon clear" })
      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "harpoon select 1" })
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "harpoon select 2" })
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "harpoon select 3" })
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "harpoon select 4" })
    end -- config
  },
}
