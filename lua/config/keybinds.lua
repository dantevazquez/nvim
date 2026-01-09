vim.g.mapleader = " "

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {desc = "Open diagnostic float"})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<Leader>w', ':bd<CR>', { desc = 'Close current buffer' })

-- Select all
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

-- Format the current buffer using LSP
vim.keymap.set('n', '<leader>i', function()
    vim.lsp.buf.format({ async = true })
end, { desc = 'LSP format file' })

vim.keymap.set({'n', 'v', 'o'}, 'gs', '^', { desc = 'Go to first non-blank character' })
vim.keymap.set({'n', 'v', 'o'}, 'gl', '$', { desc = 'Go to end of line' })
