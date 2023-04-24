
vim.g.mapleader= " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<C-d>", "<C-D>zz")
vim.keymap.set("n", "<C-u>", "<C-U>zz")
