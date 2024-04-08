local actions = require('telescope.actions')

return {
    'nvim-telescope/telescope.nvim',
    config = function ()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<Esc>"] = actions.close,
                    },
                },
            },
        })end
}
