-- Disable all git related plugins
-- if true then
--   return {}
-- end

return {
  {
    "CoreyKaylor/diffbandit.nvim",
    config = function()
      require("diffbandit").setup()
    end,
  }
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required
  --     "sindrets/diffview.nvim", -- optional - Diff integration
  --   },
  --   config = true,
  -- },
}
