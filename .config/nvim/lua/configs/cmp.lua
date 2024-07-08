local cmp = require "cmp"
local cfg = cmp.config
local mapping = cmp.mapping

local luasnip = require "luasnip"

local lspkind = require "lspkind"

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  window = {
    completion = cfg.window.bordered(),
    documentation = cfg.window.bordered(),
  },

  mapping = mapping.preset.insert {
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm {
            select = true, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          }
        end
      else
        fallback()
      end
    end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-u>"] = mapping.scroll_docs(-4),
    ["<C-d>"] = mapping.scroll_docs(4),
    ["<C-n>"] = mapping.complete(),
    ["<C-e>"] = mapping.abort(),
  },

  sources = {
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },

  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
    },
  },
}

local autopairs = require "nvim-autopairs.completion.cmp"

cmp.event:on("confirm_done", autopairs.on_confirm_done())
