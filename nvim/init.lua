-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("n", "<F1>", "<Cmd>ToggleTerm direction=horizontal size=20<CR>")
vim.keymap.set("n", "<F2>", '<cmd>lua require("renamer").rename()<cr>')
vim.keymap.set("n", "<F3>", "<cmd>RunCode<cr>")
