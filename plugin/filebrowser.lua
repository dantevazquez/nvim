vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
}, { load = true, confirm = false })

require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
})
