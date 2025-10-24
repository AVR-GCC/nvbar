-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvlsp = require "nvchad.configs.lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "tailwindcss" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "clangd", "pyright", "elixirls", "ocamllsp" },
})

local on_attach = function(client, bufnr)
  -- Here you can define your key mappings or other behavior when LSP attaches
end

vim.lsp.config.rust_analyzer = {
  cmd = { os.getenv("HOME") .. "/.local/bin/rust-analyzer" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy"
      },
    }
  }
}

vim.lsp.config.clangd = {
  capabilities = capabilities,
}

vim.lsp.config.pyright = {
  capabilities = capabilities,
}

-- configuring single server, example: typescript
vim.lsp.config.ts_ls = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

vim.lsp.config.elixirls = {
    cmd = { 'elixir-ls' },
    settings = {
        elixirls = {
            dialyzerEnabled = false,
            enableTestLenses = false,
        },
    },
    on_attach = function(client, bufnr)
        -- Set up keybindings or other buffer-specific configurations here
        -- e.g., for go to definition, code actions, etc.
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
        -- ... other keymaps
    end,
}

vim.lsp.config.tailwindcss = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "heex",
    "eelixir",
    "elixir",
  },
  init_options = {
    userLanguages = {
      heex = "html",
      elixir = "html",
      eelixir = "html",
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          [[class[:]?\s*"([^"]*)]],
        },
      },
    },
  },
}

vim.lsp.enable("tailwindcss")

vim.lsp.config.ocamllsp = {
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  root_markers = { "*.opam", "esy.json", "package. json", ".git", "dune-project", "dune-workspace" },
  capabilities = capabilities,
}

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- Check if there's an exact snippet match
      if luasnip.expandable() then
        luasnip.expand()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "luasnip", priority = 1000 },
    { name = "nvim_lsp", priority = 500 },
    { name = 'render-markdown' },
  },
})
