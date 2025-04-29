return {
  "github/copilot.vim",
  config = function()
    -- Keymaps para navegar sugerencias de Copilot
    vim.keymap.set("i", "<F8>", "<Plug>(copilot-next)", {
      silent = true,
      desc = "Copilot: Sugerencia siguiente",
    })

    vim.keymap.set("i", "<F7>", "<Plug>(copilot-previous)", {
      silent = true,
      desc = "Copilot: Sugerencia anterior",
    })
  end,
}

