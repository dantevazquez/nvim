vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/j-morano/buffer_manager.nvim",
}, { load = true, confirm = false })

require("buffer_manager").setup({})

vim.keymap.set(
    "n",
    "<leader>,",
    require("buffer_manager.ui").toggle_quick_menu,
    { desc = "Open buffer manager" }
)
