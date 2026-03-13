return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",        -- slant | thick | thin | padded_slant
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",         -- shows LSP error/warn count on tab
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    -- keymaps
    vim.keymap.set("n", "<Tab>",   "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>",           { desc = "Close buffer" })
    vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<CR>")
    vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<CR>")
    vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<CR>")
    vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<CR>")
    vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<CR>")
  end,
}
