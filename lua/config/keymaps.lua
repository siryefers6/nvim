vim.keymap.set('n', '<leader><leader>w', ':w<cr>', {desc = "Guardar archivo" })
vim.keymap.set('n', '<leader><leader>q', ':q<cr>', {desc = "Salir del archivo" })

vim.keymap.set('', '<leader>rr', ':source %<cr>', {desc = "Refrescar configuración nvim" })

vim.keymap.set('n', 'n', 'nzzzv', { desc = "Goes to the next result on the seach and put the cursor in the middle"})
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle"})
