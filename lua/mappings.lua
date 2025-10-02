require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("t", "<C-w>", "<C-\\><C-n>")
map("n", "<leader>u", "viw\"_dhp")
map("n", "<leader>j", "f s<enter><ESC>")
map("n", "<leader>k", "f,a<enter><ESC>")
map('n', '<leader>lg', '<cmd>LazyGit<CR>', { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
