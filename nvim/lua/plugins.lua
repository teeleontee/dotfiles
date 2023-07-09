vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    local g = vim.g

	use 'wbthomason/packer.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = 'TSUpdate'
    }

    use 'nvim-treesitter/playground'

    use 'p00f/nvim-ts-rainbow'

    use 'David-Kunz/markid'

    use 'kyazdani42/nvim-web-devicons'

     use 'nvim-lua/plenary.nvim'
     use 'nvim-telescope/telescope.nvim'

    use {
        'kyazdani42/nvim-tree.lua',         
        requires = {
            'kyazdani42/nvim-web-devicons', 
        },
        tag = 'nightly'
    }

    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                },
            },
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    })

    use 'windwp/nvim-autopairs'                

    require("nvim-autopairs").setup({ 
        check_ts = true, 
    })

    use { 
        "bluz71/vim-moonfly-colors", 
        as = "moonfly",
        vim.cmd [[colorscheme moonfly]],
    }

    g.moonflyTransparent = true

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
}
end)

