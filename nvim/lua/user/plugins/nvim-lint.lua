return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            markdown = {'vale'},
        }
        vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter', 'InsertLeave', 'TextChanged' }, { callback = function()
            require('lint').try_lint()
        end
        })
    end
}
