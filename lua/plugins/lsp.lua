return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Muestra diagnostico" })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostico anterior" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostico siguiente" })
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Lista de diagnosticos" })

    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      local opts = { buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = "Ir a Declaracion" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "Ir a Definicion" })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = "Mostrar información" })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "Ir a Implementacion" })
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = "Ayuda de firma" })
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts, { desc = "Agregar carpeta de trabajo" })
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts, { desc = "Eliminar carpeta de trabajo" })
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts, { desc = "Listar carpetas de trabajo" })
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts, { desc = "Definicion de tipo" })
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts, { desc = "Renombrar" })
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts, { desc = "Accion de codigo" })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "Referencias" })
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts, { desc = "Formatear" })
    end

    require("neodev").setup()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          telemetry = { enable = false },
          workspace = { checkThirdParty = false },
        }
      }
    })
    require("lspconfig").tailwindcss.setup({
      on_attach = on_attach,
    })
    require("lspconfig").pyright.setup({
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic", -- Optional: Adjusts type-checking to strict mode
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
    -- Configuración para Kotlin
    require("lspconfig").kotlin_language_server.setup({
      on_attach = on_attach,
      cmd = { "kotlin-language-server" }, -- Asegúrate de que el binario está instalado y en tu PATH
    })
  end
}
