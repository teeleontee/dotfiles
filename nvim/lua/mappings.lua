local map = vim.api.nvim_set_keymap
local mapVim = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

vim.g.mapleader = ' '


map('i', 'jj', '<Esc>', opts)

--------- NERDtree ----------
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

--------- Telescope ---------

mapVim('n', '<C-f>', builtin.find_files, opts)
mapVim('n', '<C-p>', builtin.git_files, opts)
mapVim('n', '<leader>f', function()
    builtin.grep_string({ search = vim.fn.input("grep: ") })
end)

--------- General Purpose ---
mapVim("v", "J", ":m '>+1<CR>gv=gv")
mapVim("v", "K", ":m '<-2<CR>gv=gv")

mapVim("n", "<leader>y", "\"+y")
mapVim("v", "<leader>y", "\"+y")
mapVim("n", "<leader>Y", "\"+Y")
mapVim("n", "<leader>yy", "\"+yy")

mapVim("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
mapVim("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
