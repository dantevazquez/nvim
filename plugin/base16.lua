vim.pack.add({
    "https://github.com/RRethy/base16-nvim",
}, { load = true, confirm = false })

local ok, matugen = pcall(require, "matugen")
if ok then
    matugen.setup()
end
