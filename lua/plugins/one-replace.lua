return {
  "dantevazquez/one-replace.nvim",
  keys = {
    { 
      "<leader>r",
      function() require("one-replace").open_prompt() end,
      desc = "Quick Search and Replace"
    },
  },
  config = function()
    require("one-replace").setup()
  end,
}
