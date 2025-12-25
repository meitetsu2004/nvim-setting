local M = {}

local statefile = vim.fn.stdpath("state") .. "/colorscheme.txt"

local function read_file(path)
  local f = io.open(path, "r")
  if not f then
    return nil
  end
  local content = f:read("*a")
  f:close()
  if not content then
    return nil
  end
  content = content:gsub("%s+$", "")
  return content ~= "" and content or nil
end

local function write_file(path, content)
  local f = io.open(path, "w")
  if not f then
    return
  end
  f:write(content)
  f:close()
end

local function apply_colorscheme(name)
  if not name then
    return false
  end
  local ok = pcall(vim.cmd.colorscheme, name)
  return ok
end

function M.setup(opts)
  opts = opts or {}
  local default = opts.default or "tokyonight"

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      local last = read_file(statefile)
      if last and apply_colorscheme(last) then
        return
      end
      apply_colorscheme(default)
    end,
  })

  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      local current = vim.g.colors_name
      if current and current ~= "" then
        write_file(statefile, current)
      end
    end,
  })
end

return M

