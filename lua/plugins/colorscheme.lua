return {
    "wuelnerdotexe/vim-enfocado",
    lazy = false, -- Asegura que el esquema de colores se cargue durante el inicio
    priority = 1000, -- Se carga antes que otros plugins para evitar conflictos

    config = function()
      -- Aplicar el esquema de colores "enfocado"
      vim.cmd([[colorscheme enfocado]])

      -- Eliminar el fondo de la interfaz en Normal y NonText para transparencia
      vim.cmd [[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NonText guibg=NONE ctermbg=NONE
      ]]
    end,
}

