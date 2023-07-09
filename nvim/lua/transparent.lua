function ColorTransparent(color)
    color = color or "moonfly"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = none })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = none })
end

ColorTransparent()

local cmd = vim.cmd

-- highlights --
cmd "hi LineNr guifg=#42464e guibg=NONE"
cmd "hi Comment guifg=#42464e"
cmd "hi SignColumn guibg=NONE"

