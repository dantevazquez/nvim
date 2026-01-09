return {
    { 
    'brenoprata10/nvim-highlight-colors',
    config = function()
        require('nvim-highlight-colors').setup({})
    end
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    }
}
