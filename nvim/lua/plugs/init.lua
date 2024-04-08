-- setup must be called before loading
return {
     'nvim-treesitter/playground', -- treesitter
     'p00f/nvim-ts-rainbow',
     'David-Kunz/markid',
     'kyazdani42/nvim-web-devicons',
     'nvim-telescope/telescope.nvim', -- telescope
     'nvim-lua/plenary.nvim',
     'windwp/nvim-autopairs', -- autopaurs
     'kyazdani42/nvim-tree.lua', -- nvim-tree
     'nvim-lualine/lualine.nvim',
     "catppuccin/nvim",
     { -- nvim treesitter
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true})
        end,
        --run = 'TSUpdate',
     },
     'lewis6991/gitsigns.nvim',
     'neovim/nvim-lspconfig',
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     'hrsh7th/nvim-cmp',
     "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim",
     "L3MON4D3/LuaSnip",
     'VonHeikemen/lsp-zero.nvim',
     '0x00-ketsu/autosave.nvim',
}

