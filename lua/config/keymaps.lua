-- Guardar archivo con doble líder
vim.keymap.set('n', '<leader><leader>w', ':w<cr>', {desc = "Guardar archivo" })

-- Salir del archivo con doble líder
vim.keymap.set('n', '<leader><leader>q', ':q<cr>', {desc = "Salir del archivo" })

-- Refrescar configuración de Neovim
vim.keymap.set('', '<leader>rr', ':source %<cr>', {desc = "Refrescar configuración de Neovim" })

-- Ir al siguiente resultado de la búsqueda y centrar el cursor
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Ir al siguiente resultado de la búsqueda y centrar el cursor" })

-- Ir al resultado anterior de la búsqueda y centrar el cursor
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Ir al resultado anterior de la búsqueda y centrar el cursor" })

-- Cambiar entre paneles creados con vsplit (izquierda)
vim.keymap.set('n', '<leader><leader>h', '<C-w>h', { desc = "Cambiar al panel izquierdo" })

-- Cambiar entre paneles creados con vsplit (derecha)
vim.keymap.set('n', '<leader><leader>l', '<C-w>l', { desc = "Cambiar al panel derecho" })

-- Volver al buffer anterior
vim.keymap.set('n', '<leader><leader>b', ':buffer #<cr>', { desc = "Volver al buffer anterior" })

