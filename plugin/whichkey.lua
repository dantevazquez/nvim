vim.pack.add({
    "https://github.com/folke/which-key.nvim",
}, { load = true, confirm = false })

require("which-key").setup({
    preset = "helix",
    icons = {
        mappings = false,
        keys = {},
    },
})

vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
