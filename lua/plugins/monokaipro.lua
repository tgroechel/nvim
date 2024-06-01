return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  config = function()
    require("monokai-pro").setup({
      filter="machine",
      devicons = true,
    })
    vim.cmd([[colorscheme monokai-pro]])
  end
}
