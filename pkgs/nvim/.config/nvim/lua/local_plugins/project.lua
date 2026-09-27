return {
  {
    dir = vim.fn.stdpath("config"),
    name = "project-config",
    lazy = false,
    config = function()
      require("config.project").setup()
    end,
  },
}
