return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        -- Optional: customize colors or features here
        transparent_bg = false,
      })
      vim.cmd([[colorscheme dracula]])
    end,
  },
}