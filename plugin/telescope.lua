local build_group = vim.api.nvim_create_augroup("telescope-fzf-native-build", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
    group = build_group,
    callback = function(event)
        local data = event.data
        if data.spec.name ~= "telescope-fzf-native.nvim" then
            return
        end
        if data.kind ~= "install" and data.kind ~= "update" then
            return
        end

        local result = vim.system({ "make" }, { cwd = data.path }):wait()
        if result.code ~= 0 then
            vim.notify("Failed to build telescope-fzf-native.nvim", vim.log.levels.ERROR)
        end
    end,
})

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
}, { load = true, confirm = false })

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
            },
            n = {
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                ["dd"] = actions.delete_buffer,
            },
        },
    },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "Find Symbols" })
