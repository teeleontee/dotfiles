local map = vim.api.nvim_set_keymap
local mapvim = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

----------------------------------------------
-- Normal Vim Mappings -----------------------
----------------------------------------------

map('i', 'jj', '<Esc>', opts)
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
mapvim("v", "J", ":m '>+1<CR>gv=gv")
mapvim("v", "K", ":m '<-2<CR>gv=gv")
mapvim("n", "<leader>w", ":w<CR>")
mapvim("n", "<esc><esc>", ":silent! nohls<CR>")
mapvim("n", "<C-d>", "<C-d>zz")
mapvim("n", "<C-u>", "<C-u>zz")

-- Vars replace
mapvim("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) 
mapvim("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Add "//" comments
mapvim("v", "<leader>h", ":s/\\(.*\\)/\\/\\/\\1/g<CR><Esc>:silent! nohls<CR>mt=ap't") 
mapvim("n", "<leader>h", "v$:s/\\(.*\\)/\\/\\/\\1/g<CR><Esc>:silent! nohls<CR>mt=ap't")
mapvim("v", "<leader>H", ":s/\\/\\/\\s*\\(.*\\)/\\1/g<CR><Esc>:silent! nohls<CR>mt=ap't")
mapvim("n", "<leader>H", "v$:s/\\/\\/\\s*\\(.*\\)/\\1/g<CR><Esc>:silent! nohls<CR>mt=ap't")


-- Vim Diagnostic features -------------------

mapvim("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
mapvim("n", "<leader>z", ":lua vim.lsp.buf.references()<CR>")
mapvim("n", "<leader>Z", ":cclose<CR>")

----------------------------------------------
-- Telescope stuffs --------------------------
----------------------------------------------

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

mapvim('n', '<leader><Tab>', builtin.find_files, opts)
mapvim('n', '<leader>f', builtin.lsp_references, opts)

