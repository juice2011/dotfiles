local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'omnisharp', 'rust_analyzer'},
  handlers = {
    function(server_name)
      -- Check if the server is clangd
      if server_name == 'clangd' then
        require('lspconfig').clangd.setup({
          cmd = { "clangd", 
                  "--clang-tidy"},
          on_attach = lsp_zero.on_attach,
        })
      else
        require('lspconfig')[server_name].setup({
          on_attach = lsp_zero.on_attach,
        })
      end
    end,
  }
})
