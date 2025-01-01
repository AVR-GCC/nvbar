return {
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
    end,
  },
  { 'williamboman/mason.nvim', event = { "BufReadPre", "BufNewFile" } },
  { 'williamboman/mason-lspconfig.nvim', event = { "BufReadPre", "BufNewFile" } },

  -- Completion (optional but recommended)
  { 'hrsh7th/nvim-cmp', event = "InsertEnter" },
  { 'hrsh7th/cmp-nvim-lsp', event = "InsertEnter", after = "nvim-cmp" },
  {
  	"nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,  -- This shows hidden files (dotfiles)
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
}
