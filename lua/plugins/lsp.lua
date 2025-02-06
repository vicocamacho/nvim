return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.ruby_lsp.setup({
        enabled = true,
        capabilities = capabilities,
        init_options = {
          formatter = 'standard',
          linters = { 'standard' },
        },
        cmd = { "/Users/victor/.rbenv/shims/ruby-lsp" },
      })


      vim.keymap.set(
        "n",
        "<leader>cd",
        function()
          vim.lsp.log.debug("hola")
          vim.lsp.buf.references()
          vim.lsp.log.debug("adios")
        end
      )
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
      vim.keymap.set(
        "n",
        "<leader>hh",
        function()
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        end
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          --@diagnostic disable-next-line: missing-parameter
          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
