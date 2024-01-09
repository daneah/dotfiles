return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'pyright',
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lsp_config = require('lspconfig')
            lsp_config.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            })
            lsp_config.pyright.setup({})
        end
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.diagnostics.ruff,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                }
            })

            vim.keymap.set('n', '<Leader>gf', vim.lsp.buf.format, {})
        end
    },
}
