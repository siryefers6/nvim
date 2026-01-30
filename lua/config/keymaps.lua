-- General keymaps

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Ir a ventana izquierda" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Ir a ventana abajo" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Ir a ventana arriba" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Ir a ventana derecha" })

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = "Aumentar altura" })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = "Disminuir altura" })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = "Disminuir ancho" })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Aumentar ancho" })

-- Buffer navigation
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = "Siguiente buffer" })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = "Buffer anterior" })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Cerrar buffer" })

-- Save and quit shortcuts
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Guardar archivo" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Salir" })
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { desc = "Salir sin guardar" })

-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = "Indentar izquierda" })
vim.keymap.set('v', '>', '>gv', { desc = "Indentar derecha" })

-- Move text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Mover texto abajo" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Mover texto arriba" })

-- Keep cursor centered when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Scroll down centrado" })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Scroll up centrado" })
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Siguiente búsqueda centrado" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Búsqueda anterior centrado" })

-- Clear search highlighting
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Limpiar resaltado de búsqueda" })

-- Reload configuration
vim.keymap.set('n', '<leader>rr', ':source $MYVIMRC<CR>', { desc = "Recargar configuración" })

