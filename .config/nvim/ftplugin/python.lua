---@type fun(cmd:string|string[]):nil
local function run_in_split(cmd)
  vim.cmd ":sv"

  local bufnr = vim.fn.bufadd ""
  if bufnr == 0 then
    return
  end

  vim.cmd(":b" .. bufnr)

  vim.fn.termopen(cmd)
end

vim.keymap.set("n", "<leader>at", function()
  run_in_split "pytest"
end)

vim.keymap.set("n", "<leader>ac", function()
  run_in_split { "ruff", "check" }
end)

vim.keymap.set("n", "<leader>aC", function()
  run_in_split { "ruff", "check", "--fix" }
end)
