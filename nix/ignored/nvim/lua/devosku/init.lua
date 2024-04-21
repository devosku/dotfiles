require("devosku.set")
require("devosku.remap")
require("devosku.lazy_init")

-- disable netrw because we using nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- if you wish to enable netrw then uncomment these customizations
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25

-- enable 24-bit colour
vim.opt.termguicolors = true
