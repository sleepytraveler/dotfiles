return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    servers = {
      clangd = {
        mason = false,
        settings = {},
      },
    },
  },
}
