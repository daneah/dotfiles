local function set_python_lsp()
    local handle = io.popen('py -c "import sys; print(sys.prefix)"', 'r')
    local python_path = 'python'

    if handle then
        local result = handle:read("*a")
        handle:close()
        python_path = string.gsub(result, "%s+", "") .. '/bin/python'
    end

    vim.lsp.config("pyright", {
        settings = {
            python = {
                pythonPath = python_path,
            },
        },
    })
    vim.lsp.enable("pyright")
end
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, { pattern = '*', callback = set_python_lsp })

local function set_vue_lsp()
    local handle = io.popen('node -p "process.execPath"', 'r')
    if handle then
        local node_path = handle:read("*a")
        local typescript_path = string.gsub(node_path, "/bin/node\n", "") .. '/lib/node_modules/typescript/lib'

        vim.lsp.config("vue_ls", {
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
        vim.lsp.enable("vue_ls")
    end
end
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, { pattern = '*', callback = set_vue_lsp })

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
                    'vue_ls',
                    'yamlls',
                },
                automatic_enable = false,
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local vue_language_server_path = vim.fn.expand "$MASON/packages/codelldb"

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.enable("gitlab_ci_ls")
            vim.lsp.enable("gleam")
            vim.lsp.enable("graphql")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("ruff")
            vim.lsp.enable("yamlls")

            vim.lsp.config("ts_ls", {
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
            })
            vim.lsp.enable("ts_ls")
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
