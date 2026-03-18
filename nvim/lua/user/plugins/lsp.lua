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
                    'ruff',
                    'ts_ls',
                    'ty',
                    'vue_ls',
                    'yamlls',
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
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

            local lsp_util = require('lsp-util')

            local typescript_plugins = {}
            local vue_language_server_root = lsp_util.find_mason_package("vue-language-server")
            if vue_language_server_root then
                local vue_typescript_plugin_path = vim.fs.joinpath(
                  vue_language_server_root, "node_modules", "@vue", "typescript-plugin"
                )
                table.insert(typescript_plugins, {
                    name = "@vue/typescript-plugin",
                    location = vue_typescript_plugin_path,
                    languages = { "vue" },
                    configNamespace = "typescript",
                })
            end

            vim.lsp.config("vue_ls", {})
            vim.lsp.config("ts_ls", {
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                init_options = {
                    hostInfo = "neovim",
                    plugins = typescript_plugins,
                    typescript = {
                        tsdk = lsp_util.find_tssdk(),
                    },
                },
                on_new_config = function(new_config, new_root_dir)
                  local proj_tsdk = lsp_util.find_tssdk(new_root_dir)
                  if proj_tsdk then
                    new_config.init_options = new_config.init_options or {}
                    new_config.init_options.typescript = new_config.init_options.typescript or {}
                    new_config.init_options.typescript.tsdk = proj_tsdk
                  end
                end,
            })

            vim.lsp.enable("gitlab_ci_ls")
            vim.lsp.enable("gleam")
            vim.lsp.enable("graphql")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("ruff")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("ty")
            vim.lsp.enable("vue_ls")
            vim.lsp.enable("yamlls")
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
