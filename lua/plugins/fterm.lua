return {
    "numToStr/FTerm.nvim",
    config = function()
        local fterm = require("FTerm")

        -- Configure FTerm (Optional: adds borders, etc.)
        fterm.setup({
            border = 'rounded',
            dimensions = {
                height = 0.9,
                width = 0.9,
            },
        })

        -- 1. Normal Terminal Toggle
        vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
        vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

        -- 2. Run Lazygit
        -- Note: We use 'n' mode here so you can trigger it from your buffer
        vim.keymap.set("n", "<A-g>", function()
            fterm.run('lazygit')
        end)
        vim.keymap.set("t", "<A-g>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end,
}
