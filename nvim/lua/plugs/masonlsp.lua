local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

return {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
            },
        })
    end
}
