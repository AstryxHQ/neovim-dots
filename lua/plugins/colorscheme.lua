return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,  -- load first
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
