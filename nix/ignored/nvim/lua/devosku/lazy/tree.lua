
vim.keymap.set("n", "<leader>fm", "<cmd>NvimTreeToggle<cr>")

return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
    },

    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 40,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            }
        })
    end
}

