return {
  -- Replace iamcco/markdown-preview with mdkite.nvim
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
  {
  "selimacerbas/mdkite.nvim",
  -- a kitehost.nvim checkout under another dir name needs its spec to
  -- say name = "kitehost.nvim", or lazy.nvim clones upstream beside it
  dependencies = { "selimacerbas/kitehost.nvim" },
  -- kitehost.nvim v2.0.0 or newer, the first release with its Host check
  config = function()
    require("mdkite").setup({
      -- all optional; sane defaults shown
      instance_mode = "takeover",  -- "takeover" (one tab) or "multi" (tab per instance)
      port = 8765,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
      open_browser = true,
      default_theme = "light",      -- "dark" or "light"; initial preview theme
      debounce_ms = 300,
      mermaid_renderer = "rust"     -- needs "cargo install mermaid-rs-renderer"
    })
  end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = false,
    },
  }
}
