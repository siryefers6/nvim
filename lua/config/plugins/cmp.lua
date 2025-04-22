---@diagnostic disable: missing-fields
local cmp = require("cmp")
local luasnip = require("luasnip")

local M = {}

function M.setup()
  -- Cargar snippets de VSCode (friendly-snippets o tu propia colección de snippets)
  require("luasnip.loaders.from_vscode").lazy_load()

  -- Integración con autopairs
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  -- Configuración principal de CMP
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)  -- Expande snippets
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4, { desc = "Scroll arriba en documentación" }),
      ["<C-f>"] = cmp.mapping.scroll_docs(4, { desc = "Scroll abajo en documentación" }),
      ["<C-Space>"] = cmp.mapping.complete({ desc = "Forzar autocompletado" }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }, { desc = "Confirmar selección" }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s", desc = "Siguiente sugerencia o salto de snippet" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s", desc = "Sugerencia anterior o retroceso de snippet" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },               -- Fuente principal: LSP (para Python, Pyright, por ejemplo)
      { name = "nvim_lsp_signature_help" },-- Mostrar ayuda de firma de funciones
      { name = "luasnip" },                -- Snippets con luasnip
      { name = "buffer" },                 -- Palabras del buffer actual
      { name = "path" },                   -- Autocompletado de rutas del sistema
    }),
  })
end

return M

