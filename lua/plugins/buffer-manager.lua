  return {
      {
          "j-morano/buffer_manager.nvim",
          dependencies = {
              "nvim-lua/plenary.nvim",
          },
          config = function()
              require("buffer_manager").setup({})

              vim.keymap.set(
                  "n",
                  "<leader>,",
                  require("buffer_manager.ui").toggle_quick_menu,
                  { desc = "Open buffer manager" }
              )
          end,
      },
  }
