return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- Para instalar el servidor Pyright fácilmente
  },
  config = function()
    -- 🧭 Keymaps globales para diagnóstico
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Mostrar diagnóstico" })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Lista de diagnósticos" })

    -- 🔧 Función para ejecutar cuando Pyright se conecta
    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo con LSP" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "Ir a definición" })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = "Ir a declaración" })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "Ir a implementación" })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "Buscar referencias" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = "Mostrar documentación" })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = "Ayuda de firma" })

      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts, { desc = "Renombrar símbolo" })
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts, { desc = "Acción de código" })

      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts, { desc = "Formatear código" })
    end

    -- 🚀 Configuración de Pyright (LSP para Python)
    require("lspconfig").pyright.setup({
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",      -- Usa "strict" si quieres análisis más riguroso
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
  end
}

