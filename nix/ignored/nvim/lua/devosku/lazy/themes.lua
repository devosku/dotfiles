return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            transparent_background = true, -- disables setting the background color.
        })
        vim.cmd.colorscheme "catppuccin"

        -- make background transparent so we look cool
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
