local languages = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "html",
    "python",
    "go",
    "c",
    "json5",
}

local update_group = vim.api.nvim_create_augroup("treesitter-parser-update", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
    group = update_group,
    callback = function(event)
        local data = event.data
        if data.spec.name ~= "nvim-treesitter" then
            return
        end
        if data.kind ~= "install" and data.kind ~= "update" then
            return
        end

        vim.schedule(function()
            vim.cmd.TSUpdate()
        end)
    end,
})

vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
}, { load = true, confirm = false })

local treesitter = require("nvim-treesitter")
treesitter.setup({})
treesitter.install(languages)

local enabled = {}
for _, language in ipairs(languages) do
    enabled[language] = true
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(event)
        local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if not enabled[language] then
            return
        end

        if pcall(vim.treesitter.start, event.buf, language) then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
