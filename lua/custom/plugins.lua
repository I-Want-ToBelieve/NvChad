local overrides = require("custom.configs.overrides")

-- @see https://github.com/vscode-neovim/vscode-neovim#neovim-configuration
local is_vscode = vim.g.vscode == 1

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    enabled = not is_vscode,
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    enabled = not is_vscode,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- if is vscode then to make a plugin not be loaded
  {
    "NvChad/base46",
    enabled = not is_vscode,
  },

  {
    "NvChad/ui",
    enabled = not is_vscode,
  },

  {
    "NvChad/nvterm",
    enabled = not is_vscode,
  },

  {
    "NvChad/nvim-colorizer.lua",
    enabled = not is_vscode,
  },

  {
    "nvim-tree/nvim-web-devicons",
    enabled = not is_vscode,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = not is_vscode,
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = not is_vscode,
  },

  {
    "hrsh7th/nvim-cmp",
    enabled = not is_vscode,
  },

  {
    "nvim-telescope/telescope.nvim",
    enabled = not is_vscode,
  },

  {
    "folke/which-key.nvim",
    enabled = not is_vscode,
  },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
