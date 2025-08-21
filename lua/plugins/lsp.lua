return {
  -- Plugin LSP base para configuraciones de servidores
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Mason para administrar LSPs
    { "mason-org/mason.nvim" },
    -- Integración entre mason y lspconfig
    { "mason-org/mason-lspconfig.nvim" },
    -- Autocompletado (recomendado si lo usas)
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    --  1. Habilitar capacidades para nvim-cmp + LSP
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    --  2. Opciones de Mason
    require("mason").setup()

    --  Opciones de mason-lspconfig si lo tienes activo
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },  -- servidores a instalar automáticamente
      automatic_installation = true,
    })

    -- Keymaps globales para diagnosticar
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Mostrar diagnóstico" })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Lista de diagnósticos" })

    -- Función on_attach para Pyright
    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts, { desc = "Renombrar símbolo LSP" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "Ir a definición" })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = "Ir a declaración" })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "Ir a implementación" })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "Buscar referencias" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = "Mostrar documentación" })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = "Ayuda de firma" })
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts, { desc = "Acción de código" })

      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts, { desc = "Formatear código" })
    end

    -- Configuración de Pyright
    require("lspconfig").pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
  end,
}

