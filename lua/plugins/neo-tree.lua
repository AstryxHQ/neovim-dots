return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      event_handlers = {                          -- ← now inside setup()
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
            vim.opt_local.fillchars = "eob: "    -- space char, kills the ~
          end,
        },
      },

      source_selector = {
        winbar = true,
        statusline = false,
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 0,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = false,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
        },
        git_status = {
          symbols = {
            added     = "",
            deleted   = "",
            modified  = "",
            renamed   = "➜",
            untracked = "★",
            ignored   = "◌",
            unstaged  = "✗",
            staged    = "✓",
            conflict  = "",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = false,
          ["<cr>"]    = "open",
          ["s"]       = "open_vsplit",
          ["S"]       = "open_split",
          ["t"]       = "open_tabnew",
          ["C"]       = "close_node",
          ["z"]       = "close_all_nodes",
          ["a"]       = { "add", config = { show_path = "none" } },
          ["A"]       = "add_directory",
          ["d"]       = "delete",
          ["r"]       = "rename",
          ["y"]       = "copy_to_clipboard",
          ["x"]       = "cut_to_clipboard",
          ["p"]       = "paste_from_clipboard",
          ["q"]       = "close_window",
          ["R"]       = "refresh",
          ["?"]       = "show_help",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = { "node_modules" },
          never_show = { ".DS_Store", "thumbs.db" },
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
      git_status = {
        window = { position = "float" },
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<CR>",  { desc = "Focus Neo-tree" })
  end,
}
