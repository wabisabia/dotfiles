---@module "lazy"
---@type LazyPluginSpec
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
  },
}
