return {
  {
    -- snippet plugin
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("configs.misc").luasnip(opts)
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
      require "configs.snippets"
    end,
  },
  { 'williamboman/mason.nvim', event = { "BufReadPre", "BufNewFile" } },
  { 'williamboman/mason-lspconfig.nvim', event = { "BufReadPre", "BufNewFile" } },

  -- Completion (optional but recommended)
  { 'hrsh7th/nvim-cmp', event = "InsertEnter" },
  { 'hrsh7th/cmp-nvim-lsp', event = "InsertEnter", after = "nvim-cmp" },
  {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "markdown", "markdown_inline", "elixir", "heex", "eex", "vim", "lua", "vimdoc", "html", "css", "typescript", "tsx" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  	-- opts = {
  	-- 	ensure_installed = {
  	-- 		"vim", "lua", "vimdoc",
  	--     "html", "css"
  	-- 	},
  	-- },
  },

  -- File explorer (if you use it)
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,  -- This shows hidden files (dotfiles)
        },
      })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
  },
  { "neoclide/coc.nvim", branch = "release" },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  }
}
