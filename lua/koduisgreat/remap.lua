vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
vim.keymap.set("n", "<C-d>", "<C-D>zz")
vim.keymap.set("n", "<C-u>", "<C-U>zz")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<leader>p", '"*p')
vim.keymap.set("n", "<leader>P", '"+p')
vim.keymap.set("v", "<leader>y", '"*y')
vim.keymap.set("v", "<leader>Y", '"+y')
