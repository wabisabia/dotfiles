require "lazy"

---@type LazyPluginSpec[]
return {
  -- We don't know where we are...
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = require "opts.nvim-tree",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-treesitter/nvim-treesitter",
      "folke/trouble.nvim",
    },
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- ... at least we know what vim is doing
  {
    "nvim-lua/plenary.nvim",
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "rcarriga/nvim-notify",
    opts = require "opts.notify",
    init = function()
      vim.notify = require "notify"
    end,
  },

  -- We can edit text
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "echasnovski/mini.align",
    version = "*",
    opts = {},
  },

  {
    "folke/trouble.nvim",
    opts = require "opts.trouble",
    cmd = "Trouble",
  },

  {
    "folke/todo-comments.nvim",
    opts = require "opts.todo",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- We can edit structured text??
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
    config = function()
      require "configs.cmp"
    end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "windwp/nvim-autopairs",
      "onsails/lspkind.nvim",
    },
  },

  {
    "hrsh7th/cmp-buffer",
  },

  {
    "f3fora/cmp-spell",
  },

  {
    "hrsh7th/cmp-nvim-lsp-document-symbol",
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "rafamadriz/friendly-snippets",
  },

  {
    "hrsh7th/cmp-nvim-lsp",
  },

  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },

  -- We can even code!!
  {
    "williamboman/mason.nvim",
    opts = {
      log_level = vim.log.levels.INFO,
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "onsails/lspkind.nvim",
  },

  {
    "stevearc/conform.nvim",
    opts = require "opts.conform",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "tpope/vim-fugitive",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = require "opts.lazydev",
  },

  {
    "Bilal2453/luvit-meta",
    lazy = true,
  }, -- optional `vim.uv` typings

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "configs.telescope-dap"
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python",
    config = function()
      require "configs.dap-python"
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = require "opts.dap-virtual-text",
  },

  -- Ascension.
  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "folke/zen-mode.nvim",
    opts = {},
  },

  {
    "folke/twilight.nvim",
    opts = {},
  },
}
