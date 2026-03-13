return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- DO NOT use require("nvim-treesitter.configs")
    -- Use the new simplified setup instead
    require("nvim-treesitter").setup({
      -- Languages to install immediately
      ensure_installed = { "lua", "vim", "vimdoc", "html", "css" },

      -- This enables the auto-install feature
      auto_install = true,

      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
