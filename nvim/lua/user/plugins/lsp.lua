local function set_python_lsp()
    local handle = io.popen('py -c "import sys; print(sys.prefix)"', 'r')
    local python_path = 'python'
    if handle then
        local result = handle:read("*a")
        handle:close()
        python_path = string.gsub(result, "%s+", "") .. '/bin/python'
    end
    local lsp_config = require('lspconfig')
    print('Python path: ' .. python_path)
    lsp_config.pyright.setup({
        settings = {
            python = {
                pythonPath = python_path,
            },
        },
    })
end
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, { pattern = '*', callback = set_python_lsp })

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
                    'yamlls',
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
            lsp_config.yamlls.setup({})
        end
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                }
            })

            vim.keymap.set('n', '<Leader>gf', vim.lsp.buf.format, {})
        end
    },
}
