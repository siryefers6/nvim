return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Setup Mason
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    -- Setup Mason-LSPConfig
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",       -- Python
        "ts_ls",         -- TypeScript/JavaScript
        "html",          -- HTML
        "cssls",         -- CSS
        "lua_ls",        -- Lua
        "jsonls",        -- JSON
      },
      automatic_installation = true,
    })

    -- LSP capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Mostrar diagnóstico" })
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Lista de diagnósticos" })

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
      },
    })

    -- LSP attach function
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }

      -- Navigation
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Ir a definición" }))
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Ir a declaración" }))
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Ir a implementación" }))
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Buscar referencias" }))
      vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Ir a definición de tipo" }))

      -- Documentation
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Documentación" }))
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Ayuda de firma" }))

      -- Actions
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Acción de código" }))
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Renombrar" }))

      -- Formatting
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, vim.tbl_extend("force", opts, { desc = "Formatear código" }))
    end

    -- LSP server configurations
    local lspconfig = require('lspconfig')

    -- Python (Pyright)
    lspconfig.pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
    })

    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
          },
        },
      },
    })

    -- HTML
    lspconfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "htmldjango" },
    })

    -- CSS
    lspconfig.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        },
      },
    })

    -- JSON
    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- Lua
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
            },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
