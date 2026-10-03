return {
  "saghen/blink.cmp",
  opts = {
    -- 1. Bind your custom key combination to trigger completion
    keymap = {
      preset = "super-tab", -- or "super-tab" / "enter"
      ["<C-n>"] = { "show", "fallback" },
      -- Force Tab/S-Tab to select next/prev in the completion menu
      -- while preserving snippet jumping when the menu is closed
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    -- 2. Optional: Disable automatic popup as you type
    -- (Delete this block if you still want autocomplete to show automatically)
    completion = {
      trigger = {
        show_on_keyword = false,
        show_on_trigger_character = false,
      },
      menu = {
        auto_show = false,
      },
    },
  },
}
