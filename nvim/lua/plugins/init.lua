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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- ... or what we're doing...
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  -- ... at least we know what vim is doing
  {
    "nvim-lua/plenary.nvim",
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      fps = 120,
      render = "wrapped-compact",
      stages = "no_animation",
      timeout = 2000,
      top_down = false,
    },
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "folke/trouble.nvim",
    opts = require "configs.trouble",
    cmd = "Trouble",
  },

  {
    "folke/todo-comments.nvim",
    opts = require "configs.todo",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- We can edit structured text??
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
    dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects" } },
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
    },
  },

  {
    "hrsh7th/cmp-buffer",
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
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
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "tpope/vim-fugitive",
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "Bilal2453/luvit-meta",
    lazy = true,
  }, -- optional `vim.uv` typings

  -- Ascension.
  {
    "folke/zen-mode.nvim",
    opts = {},
  },

  {
    "folke/twilight.nvim",
    opts = {},
  },
}
