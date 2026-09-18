local opts = { buffer = true, silent = true }

vim.keymap.set({ "n", "x", "o" }, "j", "gj", vim.tbl_extend("force", opts, {
  desc = "Move down one visible line",
}))
vim.keymap.set({ "n", "x", "o" }, "k", "gk", vim.tbl_extend("force", opts, {
  desc = "Move up one visible line",
}))
vim.keymap.set({ "n", "x", "o" }, "gs", "g^", vim.tbl_extend("force", opts, {
  desc = "Go to first non-blank character of visible line",
}))
vim.keymap.set({ "n", "x", "o" }, "gl", "g$", vim.tbl_extend("force", opts, {
  desc = "Go to end of visible line",
}))
