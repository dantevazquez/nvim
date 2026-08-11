vim.pack.add({
    "https://github.com/brenoprata10/nvim-highlight-colors",
    "https://github.com/windwp/nvim-autopairs",
}, { load = true, confirm = false })

require("nvim-highlight-colors").setup({})
require("nvim-autopairs").setup({})
