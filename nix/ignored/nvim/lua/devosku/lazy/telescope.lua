return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {'nvim-lua/plenary.nvim'},

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<C-p>', function()
            builtin.git_files({ show_untracked = true })
        end)
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fgg', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
