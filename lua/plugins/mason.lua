return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      ensure_installed = { "pyright" },
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function(client, bufnr)
              local buf_map = function(mode, lhs, rhs, desc)
                local opts = { buffer = bufnr, desc = desc }
                vim.keymap.set(mode, lhs, rhs, opts)
              end

              buf_map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
              buf_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
              buf_map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
              buf_map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
              buf_map("n", "gr", vim.lsp.buf.references, "References")
              buf_map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
            end,
          })
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        floating_window = true,
        hint_enable = true,
        hint_prefix = "🐼 ", -- nice hint icon
        handler_opts = {
          border = "rounded", -- callout border style
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

