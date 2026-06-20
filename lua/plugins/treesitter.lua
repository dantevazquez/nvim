return {{
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = {"lua", "vim", "vimdoc", "query", "javascript", "html", "python", "go", "c", "json5"},
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
}}

