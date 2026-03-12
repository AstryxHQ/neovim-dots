return {
  -- LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",               -- better lua_ls for neovim config files
    },
    config = function()
      -- must be before lspconfig
      require("neodev").setup()

      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright" },
        automatic_installation = true,
      })

      -- rounded borders on hover/signature
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      -- diagnostic signs + style
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded" },
      })

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },  -- no "undefined global vim" warning
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.enable({ "lua_ls", "ts_ls", "pyright" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(e)
          local map = function(k, v, desc)
            vim.keymap.set("n", k, v, { buffer = e.buf, desc = desc })
          end
          map("gd",          vim.lsp.buf.definition,      "Go to definition")
          map("gD",          vim.lsp.buf.declaration,     "Go to declaration")
          map("gr",          vim.lsp.buf.references,      "References")
          map("gi",          vim.lsp.buf.implementation,  "Go to implementation")
          map("K",           vim.lsp.buf.hover,           "Hover docs")
          map("<leader>rn",  vim.lsp.buf.rename,          "Rename")
          map("<leader>ca",  vim.lsp.buf.code_action,     "Code action")
          map("<leader>d",   vim.diagnostic.open_float,   "Line diagnostics")
          map("[d",          vim.diagnostic.goto_prev,    "Prev diagnostic")
          map("]d",          vim.diagnostic.goto_next,    "Next diagnostic")
        end,
      })
    end,
  },

  -- Pictograms for completion items
  {
    "onsails/lspkind.nvim",
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",              -- complete words from current buffer
      "hrsh7th/cmp-path",                -- complete file paths
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },

        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = lspkind.cmp_format({
            mode    = "symbol_text",    -- icon + text label
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<C-u>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-d>"]     = cmp.mapping.scroll_docs(4),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
