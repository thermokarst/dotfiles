vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2

vim.keymap.set({ "n", "v" }, "<leader>y", "\"*y", { desc = "yank to clipboard" })
