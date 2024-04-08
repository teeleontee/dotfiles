require('settings')
require('plugins')
require('mappings')

vim.cmd.colorscheme "catppuccin-macchiato"

if vim.g.neovide then
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true

    vim.keymap.set('v', '<C-S-C>', '"+y') -- Copy
    vim.keymap.set('n', '<C-S-V>', '"+P') -- Paste -- normal mode
    vim.keymap.set('v', '<C-S-V>', '"+P') -- Paste visual mode
    vim.keymap.set('i', '<C-S-V>', '<ESC>l"+Pli') -- Paste insert mode


    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.2)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1/1.2)
    end)
end

vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<D-v>', '<C-R>', { noremap = true, silent = true })
