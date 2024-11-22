local plugins = {
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "typescript-language-server"
      }
    }
  },
  {
    'neoclide/coc.nvim',
    branch = 'release',
    enabled = true,
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'python', 'lua' },
    -- config = function()
    --   -- Use tab for trigger completion and navigate to the next complete item
    --   vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
    --   vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
    --
    --   -- Trigger code action
    --   vim.api.nvim_set_keymap("n", "<leader>ca", "<Plug>(coc-codeaction)", { noremap = true, silent = true })
    --
    --   -- Show documentation on hover
    --   vim.api.nvim_set_keymap("n", "K", ":call CocAction('doHover')<CR>", { noremap = true, silent = true })
    --
    --   -- Go to definition
    --   vim.api.nvim_set_keymap("n", "gd", ":call CocAction('jumpDefinition')<CR>", { noremap = true, silent = true })
    --
    --   -- Format selected code
    --   vim.api.nvim_set_keymap("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
    --
    --   -- Autocommand to highlight symbol under cursor
    --   vim.cmd([[
    --     autocmd CursorHold * silent call CocActionAsync('highlight')
    --   ]])
    --
    --   -- Configure diagnostics signs (optional)
    --   vim.fn.sign_define("CocErrorSign", { text = "", texthl = "CocErrorSign" })
    --   vim.fn.sign_define("CocWarningSign", { text = "", texthl = "CocWarningSign" })
    --   vim.fn.sign_define("CocInfoSign", { text = "", texthl = "CocInfoSign" })
    --   vim.fn.sign_define("CocHintSign", { text = "", texthl = "CocHintSign" })
    --
    --   -- Automatically start Coc diagnostics when opening a file
    --   vim.cmd([[
    --     autocmd BufEnter * silent! CocStart
    --   ]])
    --
    -- end
  },
  {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 1   -- Enable git blame by default
      vim.g.gitblame_message_template = '<author> • <summary> • <date>'
    end,
    cmd = { "GitBlameToggle" },    -- Optional: Lazy-load the plugin
    keys = {
      { "<Leader>gb", ":GitBlameToggle<CR>", desc = "Toggle Git Blame" },
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      -- require "custom.configs.lspconfig"
      require "custom.configs.snippets"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
   -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {require("plugins.configs.dapui")},
  {require("plugins.configs.dap")}
}
return plugins
