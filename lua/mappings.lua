require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("t", "<C-w>", "<C-\\><C-n>")
map("n", "<leader>u", "viw\"_dhp")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
