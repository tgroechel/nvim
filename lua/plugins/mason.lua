return
{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({})
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end
  },
  {

    'hrsh7th/cmp-nvim-lsp',
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Can likely auto setup these
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.supports_method('textDocument/rename') then
            vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename, { desc = "lsp rename" })
          end
          if client.supports_method('textDocument/implementation') then
            vim.keymap.set('n', '<leader>I', vim.lsp.buf.implementation, {desc = "lsp implementation" })
          end
          if client.supports_method('textDocument/format') then
            vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, {desc = "lsp format" })
          end
          if client.supports_method('textDocument/code_action') then
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = "lsp code_action" })
          end
          if client.supports_method('textDocument/definition') then
            vim.keymap.set('n', '<C-g>', vim.lsp.buf.definition, {desc = "lsp definition" })
          end
          if client.supports_method('textDocument/declaration') then
            vim.keymap.set('n', '<C-h>', vim.lsp.buf.declaration, {desc = "lsp declaration" })
          end
          if client.supports_method('textDocument/references') then
            vim.keymap.set('n', '<C-j>', vim.lsp.buf.references, {desc = "lsp references" })
          end
        end,
      })
    end,
  },
}
