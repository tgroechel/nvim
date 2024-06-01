return
{
  'numToStr/FTerm.nvim',
  config = function()
    local fterm = require("FTerm")
    fterm.setup({
      height = 0.97,
      width = 0.97,
    })

    vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end
}
