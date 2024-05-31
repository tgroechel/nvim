return {
    "loctvl842/monokai-pro.nvim",
    background_clear = {},
    config = function()
      require("monokai-pro").setup({
        filter="machine",
      })
    end
}
