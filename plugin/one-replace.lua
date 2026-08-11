vim.pack.add({
    "https://github.com/dantevazquez/one-replace.nvim",
}, { load = true, confirm = false })

require("one-replace").setup({})

vim.keymap.set("n", "<leader>r", function()
    require("one-replace").open_prompt()
end, { desc = "Quick Search and Replace" })
