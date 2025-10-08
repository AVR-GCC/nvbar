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

-- c (open[C]ode) - opencode in tmux pain
vim.keymap.set("v", "<leader>cv", function()
  vim.cmd('normal! "+y')

  local filepath = vim.fn.expand("%")

  if vim.bo.buftype == "terminal" then
    os.execute("tmux send-keys -t ':.+1' -l 'term: '")
  else
    local start_pos = vim.fn.getpos("v")
    local end_pos = vim.fn.getpos(".")
    local start_line = start_pos[2]
    local end_line = end_pos[2]

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end

    local path = string.format("@%s", filepath)
    local path_input_time = 200 + 20 * #path
    local line_numbers = string.format(":%d-%d", start_line, end_line)

    os.execute("tmux send-keys -t ':.+1' -l '" .. path:gsub("'", "'\\''") .. "'")
    vim.loop.sleep(path_input_time)
    os.execute("tmux send-keys -t ':.+1' Enter")
    os.execute("tmux send-keys -t ':.+1' -l '" .. line_numbers:gsub("'", "'\\''") .. "'")
    os.execute("tmux send-keys -t ':.+1' C-j")
  end

  os.execute("tmux send-keys -t ':.+1' C-v")
  os.execute("tmux send-keys -t ':.+1' C-j")
  os.execute("tmux select-pane -t ':.+1'")
end, { desc = "Send visual selection to OpenCode in adjacent tmux pane" })

vim.keymap.set({"n", "i", "v"}, "<leader>cb", function()
  os.execute("tmux send-keys -t ':.+1' C-x")
  os.execute("tmux send-keys -t ':.+1' -l 'n'")
  os.execute("tmux send-keys -t ':.+1' C-x")
  os.execute("tmux send-keys -t ':.+1' C-c")
end, { desc = "Clear OpenCode in adjacent tmux pane" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
