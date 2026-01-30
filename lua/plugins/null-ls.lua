return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    
    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.black,      -- Python
        null_ls.builtins.formatting.isort,      -- Python imports
        null_ls.builtins.formatting.prettier,   -- JavaScript/TypeScript
        null_ls.builtins.formatting.stylua,     -- Lua
        
        -- Linters
        null_ls.builtins.diagnostics.flake8,    -- Python
        null_ls.builtins.diagnostics.eslint,    -- JavaScript/TypeScript
      },
      -- Auto-format on save (optional)
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
