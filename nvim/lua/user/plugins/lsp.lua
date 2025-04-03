local function set_python_lsp()
    local handle = io.popen('py -c "import sys; print(sys.prefix)"', 'r')
    local python_path = 'python'

    if handle then
        local result = handle:read("*a")
        handle:close()
        python_path = string.gsub(result, "%s+", "") .. '/bin/python'
    end

    local lsp_config = require('lspconfig')
    lsp_config.pyright.setup({
        settings = {
            python = {
                pythonPath = python_path,
            },
        },
    })
end
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, { pattern = '*', callback = set_python_lsp })

local function set_volar_lsp()
    local handle = io.popen('node -p "process.execPath"', 'r')
    if handle then
        local node_path = handle:read("*a")
        local typescript_path = string.gsub(node_path, "/bin/node\n", "") .. '/lib/node_modules/typescript/lib'

        local lsp_config = require('lspconfig')
        lsp_config.volar.setup({
            init_options = {
                typescript = {
                    tsdk = typescript_path,
                },
            },
            on_new_config = function(new_config, new_root_dir)
                local lib_path = vim.fs.find('.yarn/sdks/typescript/lib', { path = new_root_dir, upward = true })[1]
                if lib_path then
                    new_config.init_options.typescript.tsdk = lib_path
                end
            end
        })
    end
end
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, { pattern = '*', callback = set_volar_lsp })

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
                    'gitlab_ci_ls',
                    'graphql',
                    'jsonls',
                    'lua_ls',
                    'pyright',
                    'ruff',
                    'ts_ls',
                    'volar',
                    'yamlls',
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lsp_config = require('lspconfig')
            local mason_registry = require('mason-registry')
            local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

            lsp_config.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                    },
                },
            })

            lsp_config.gitlab_ci_ls.setup({})
            lsp_config.gleam.setup({})
            lsp_config.graphql.setup({})
            lsp_config.jsonls.setup({})
            lsp_config.ruff.setup({})
            lsp_config.yamlls.setup({})

            lsp_config.ts_ls.setup({
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_language_server_path,
                            languages = {"vue"},
                        },
                    },
                },
                root_dir = lsp_config.util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git', 'yarn.lock'),
            })
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
