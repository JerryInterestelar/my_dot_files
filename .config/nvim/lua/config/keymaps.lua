-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "M - Move line DOWN", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "M - Move line UP", silent = true })

vim.keymap.set("n", "J", "mzJ`z", { desc = "M - Appends the line bellow to the current line", silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "M - Jump half page down", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "M - Jump half page up", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "M - Searched terms stay in the middle", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "M - Searched terms stay in the middle", silent = true })

-- greatest remap ever
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "M - Delete to the void register" })

vim.keymap.set(
  "n",
  "<leader>sf",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "M - Search for the select word" }
)

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "M - Select All" })
