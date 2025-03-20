return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<F2>]],                   -- Configura la tecla F2 para abrir/cerrar
    direction = "float",                       -- Usa un terminal flotante
    float_opts = {
      border = "curved",                       -- Opcional: puedes usar "single", "double", "curved", etc.
      width = math.floor(vim.o.columns * 0.7), -- 70% del ancho de la pantalla
      height = math.floor(vim.o.lines * 0.6),  -- 60% de la altura de la pantalla
      winblend = 0                             -- Transparencia opcional
    }
  }
}
