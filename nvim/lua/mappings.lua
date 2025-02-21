require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", { desc = "Toggle terminal in terminal mode" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
