return {
  {
    "LazyVim/LazyVim",
    opts = {
      checker = {
        enabled = false,
      },
      colorscheme = "everforest",
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = false,
    },
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
}
