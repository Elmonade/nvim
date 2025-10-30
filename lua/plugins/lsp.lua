return {
  -- Mason: LSP installer
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-lspconfig: Bridge between mason and lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Install these servers automatically
        ensure_installed = {
          "rust_analyzer",
          "lua_ls",
          "pyright",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.diagnostic.config({
        float = {
          border = "rounded",
        },
      })
      -- Setup LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
            vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
          vim.keymap.set("n", "gl", vim.diagnostic.open_float,
            vim.tbl_extend("force", opts, { desc = "Show Diagnostic" }))
          vim.keymap.set("n", ";rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
          vim.keymap.set("n", ";la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
          vim.keymap.set("n", ";lf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "Format Buffer" }))
        end,
      })

      require("lspconfig.ui.windows").default_options.border = "rounded"
      -- Make floating windows match theme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- Match normal window background
          vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
          vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
        end,
      })

      -- Apply immediately
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

      -- Get LSP capabilities for completion
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup each LSP server using vim.lsp.config
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      -- Enable the LSP servers for appropriate filetypes
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ts_ls")
    end,
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
