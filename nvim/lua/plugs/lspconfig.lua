
return {
  -- lspconfig
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()
        local lspconfig = require('lspconfig')

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('lspconfig').lua_ls.setup({})

        lspconfig.tsserver.setup({
            capabilities=capabilities,
        })

        lspconfig.clangd.setup({
            capabilities=capabilities,
        })

        lspconfig.pyright.setup({
            capabilities=capabilities,
        })

        require('lspconfig').rust_analyzer.setup({
            capabilities=capabilities,
            settings = {
                ['rust-analyzer'] = {
                    assist = {
                        importEnforceGranularity = true,
                        importPrefix = 'crate',
                    },
                    cargo = {
                        allFeatures = true,
                    },
                    checkOnSave = {
                        command = 'clippy',
                    },
                    inlayHints = { locationLinks = false },
                    diagnostics = {
                        enable = true,
                        experimental = {
                            enable = true,
                        },
                    },
                },
            },

        })
    end
}
