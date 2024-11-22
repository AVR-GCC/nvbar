---@type ChadrcConfig
local M = {}

M.ui = { theme = 'chocolate' }
M.plugins = "custom.plugins"
M.mappings = {
  general = {
    t = {
      ["<C-w>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    }
  }
}

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
    callback = function()
        -- Disable CMP for JavaScript/TypeScript files
        require('cmp').setup.buffer { enabled = false }
    end,
})

vim.api.nvim_set_keymap('n', '<leader>u', "viw\"_dhp", { noremap = true, silent = true })
return M
