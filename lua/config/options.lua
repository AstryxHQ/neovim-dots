local opt = vim.opt

opt.number = true           -- line numbers
opt.relativenumber = true   -- relative line numbers
opt.tabstop = 4             -- 2-space tabs
opt.shiftwidth = 2
opt.expandtab = true        -- spaces instead of tabs
opt.smartindent = true
opt.wrap = false            -- no line wrap
opt.termguicolors = true    -- true color support
opt.signcolumn = "yes"      -- always show sign column
opt.clipboard = "unnamedplus" -- system clipboard
opt.splitright = true       -- vertical splits go right
opt.splitbelow = true       -- horizontal splits go below
opt.ignorecase = true       -- case-insensitive search
opt.smartcase = true        -- ...unless uppercase used
opt.scrolloff = 8           -- keep 8 lines above/below cursor

-- Transparency
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local groups = {
      "Normal", "NormalNC", "NormalFloat",
      "SignColumn", "StatusLine", "StatusLineNC",
      "WinBar", "WinBarNC", "TabLine", "TabLineFill",
      "EndOfBuffer", "LineNr", "CursorLineNr",
      "Folded", "FoldColumn", "FloatBorder",
      "NeoTreeNormal", "NeoTreeNormalNC",
      "NeoTreeEndOfBuffer", "NeoTreeWinSeparator",
      "NeoTreeTitleBar",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end
  end,
})
