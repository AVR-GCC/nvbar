-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "clangd", "pyright" },
})
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  -- Here you can define your key mappings or other behavior when LSP attaches
end

nvim_lsp.rust_analyzer.setup({
  cmd = { os.getenv("HOME") .. "/.local/bin/rust-analyzer" },
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy"
      },
    }
  }
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
nvim_lsp.rust_analyzer.setup({
  capabilities = capabilities,
  -- ... other settings from above ...
})
nvim_lsp.clangd.setup({
  capabilities = capabilities,
  -- ... other settings from above ...
})
nvim_lsp.pyright.setup({
  capabilities = capabilities,
  -- ... other settings from above ...
})
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
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
