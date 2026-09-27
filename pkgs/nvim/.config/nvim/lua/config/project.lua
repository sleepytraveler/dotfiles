local M = {}
local loaded = {}

local function find_project_config(bufnr)
  local file = vim.api.nvim_buf_get_name(bufnr)
  if file == "" then
    return
  end

  local git_root = vim.fs.root(file, ".git")
  if not git_root then
    return
  end

  for directory in vim.fs.parents(file) do
    local vscode = vim.fs.joinpath(directory, ".vscode")
    local stat = vim.uv.fs_stat(vscode)
    if stat and stat.type == "directory" then
      return vim.fs.joinpath(vscode, "nvim.lua")
    end

    if directory == git_root then
      return
    end
  end
end

function M.setup()
  vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("ProjectVscodeConfig", { clear = true }),
    callback = function(event)
      local path = find_project_config(event.buf)
      if not path or loaded[path] or not vim.uv.fs_stat(path) then
        return
      end

      local source = vim.secure.read(path)
      if type(source) ~= "string" then
        return
      end

      local chunk, err = load(source, "@" .. path)
      if not chunk then
        vim.notify(err, vim.log.levels.ERROR)
        return
      end

      local ok, runtime_err = xpcall(chunk, debug.traceback)
      if not ok then
        vim.notify(runtime_err, vim.log.levels.ERROR)
        return
      end

      loaded[path] = true
    end,
  })
end

return M
