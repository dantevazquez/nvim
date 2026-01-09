require('config.options')
require('config.keybinds')
require('config.lazy')

-- Auto-enable LSPs based on files in ./lsp
local lsp_dir = vim.fn.stdpath("config") .. "/lsp"

local files = vim.fn.globpath(lsp_dir, "*.lua", false, true)

for _, file in ipairs(files) do
  local server = vim.fn.fnamemodify(file, ":t:r")
  vim.lsp.enable(server)
end

