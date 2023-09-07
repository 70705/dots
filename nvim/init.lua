-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set("n", "<F1>", "<Cmd>ToggleTerm direction=horizontal size=20<CR>")
vim.keymap.set("n", "<F2>", "<cmd>RunCode<cr>")
