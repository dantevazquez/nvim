vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.magic = false
vim.opt.undofile = true
vim.opt.colorcolumn = "80,100"
vim.opt.conceallevel = 2
-- Create a central directory for all undo files
local undo_path = vim.fn.stdpath("data") .. "/undo"

-- Create the directory if it doesn't exist yet
if vim.fn.isdirectory(undo_path) == 0 then
    vim.fn.mkdir(undo_path, "p")
end

vim.opt.undodir = undo_path

-- highlight yanking    
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- autocomplete
vim.o.autocomplete = true

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
    end,
})

vim.o.completeopt = 'menuone,noinsert,fuzzy,popup'
vim.o.pumheight = 5;

vim.keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 0 then
        return "<Tab>"
    end

    if vim.fn.complete_info({ "selected" }).selected == -1 then
        return "<C-n><C-y>"
    end

    return "<C-y>"
end, { expr = true, desc = "Accept completion" })
