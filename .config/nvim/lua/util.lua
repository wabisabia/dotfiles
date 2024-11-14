local M = {}

---@type fun(modes:string|string[], lhs:string, rhs:string|function, desc:string)
M.map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
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

---@type fun(cmd:string|string[]):nil
M.run_in_split = function(cmd)
  vim.cmd ":sv"

  local bufnr = vim.fn.bufadd ""
  if bufnr == 0 then
    return
  end

  vim.cmd(":b" .. bufnr)

  vim.fn.termopen(cmd)
end

return M
