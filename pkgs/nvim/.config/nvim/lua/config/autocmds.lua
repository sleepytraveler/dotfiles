-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for c/cpp files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "h", "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "asl", "asi" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- Look for project specific config files in .vscode folder in the hierarchy
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Look for .vscode/nvim.lua or .vscode/exrc going up the directory tree
    local file_path = vim.fs.find({ ".vscode/nvim.lua", ".vscode/exrc" }, {
      path = vim.fn.getcwd(),
      upward = true,
      stop = vim.env.HOME, -- Stops searching at your home directory for safety
    })[1]

    if file_path and vim.fn.filereadable(file_path) == 1 then
      -- Securely execute the file (dofile for Lua, source for Vimscript)
      if file_path:match("%.lua$") then
        dofile(file_path)
      else
        vim.cmd("source " .. vim.fn.fnameescape(file_path))
      end
    end
  end,
})
