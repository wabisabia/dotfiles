local M = {}

---@type fun(modes:string|string[], lhs:string, rhs:string|function, desc:string, bufnr?:integer|boolean)
---@param buffer? integer|boolean Creates buffer-local mapping, `0` or `true` for current buffer.
M.map = function(mode, lhs, rhs, desc, buffer)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buffer })
end

--- @class util.input.Opts
--- @inlinedoc
---
--- Text of the prompt
--- @field prompt? string
---
--- Default reply to the input
--- @field default? string
---
--- Specifies type of completion supported
--- for input. Supported types are the same
--- that can be supplied to a user-defined
--- command using the "-complete=" argument.
--- See |:command-completion|
--- @field completion? string
---
--- Function that will be used for highlighting
--- user inputs.
--- @field highlight? function

---@type fun(cmd:fun(string), opts:util.input.Opts?)
M.input = function(cmd, opts)
  vim.ui.input(opts, function(input)
    if not input then
      return
    end
    cmd(input)
  end)
end

---@type fun(cmd:string|string[], title:string?):nil
M.run_in_split = function(cmd, title)
  vim.cmd ":sv"

  if title == nil then
    if type(cmd) == "string" then
      title = cmd
    else
      title = vim.fn.join(cmd)
    end
  end
  local bufnr = vim.fn.bufadd(title)
  if bufnr == 0 then
    return
  end

  vim.cmd(":b" .. bufnr)

  vim.fn.termopen(cmd)
end

return M
