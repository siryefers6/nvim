# Configuración Neovim Moderna

Una configuración completa y moderna de Neovim optimizada para desarrollo en Python, JavaScript, HTML y CSS con soporte completo de LSP, autocompletado y GitHub Copilot.

## ✨ Características

- 🚀 **Instalación con un comando**: Configuración automática completa
- 🔧 **LSP integrado**: Soporte completo para Python, JavaScript/TypeScript, HTML, CSS, JSON y Lua
- 🎯 **Autocompletado inteligente**: nvim-cmp con snippets y múltiples fuentes
- 🤖 **GitHub Copilot**: Integración perfecta para asistencia de código con IA
- 🌳 **Treesitter**: Sintaxis highlighting avanzado
- 🔍 **Telescope**: Búsqueda difusa de archivos y texto
- 📦 **Mason**: Gestión automática de LSP servers
- 🎨 **UI moderna**: Statusline, iconos y temas configurados

## 📋 Requisitos Previos

### Sistema Operativo
- Linux (Ubuntu/Debian recomendado)
- macOS
- Windows (WSL2 recomendado)

### Software Necesario

1. **Neovim 0.9.0 o superior**
   ```bash
   # Verificar versión
   nvim --version
   ```

2. **Git**
   ```bash
   sudo apt update
   sudo apt install git
   ```

3. **Node.js 18+ y npm** (para LSP servers y Copilot)
   ```bash
   # Usando nvm (recomendado)
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
   
   # Reiniciar terminal, luego:
   nvm install 20
   nvm use 20
   nvm alias default 20
   ```

4. **Python 3.8+**
   ```bash
   sudo apt install python3 python3-pip
   pip3 install pynvim
   ```

5. **Ripgrep** (para Telescope)
   ```bash
   sudo apt install ripgrep
   ```

6. **Build tools** (para compilar algunas dependencias)
   ```bash
   sudo apt install build-essential
   ```

## 🚀 Instalación

### Paso 1: Instalar Neovim (si no está instalado)

#### Opción A: Usando asdf (Recomendado - última versión)
```bash
# Instalar asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
source ~/.bashrc

# Instalar Neovim
asdf plugin-add neovim
asdf install neovim latest
asdf global neovim latest

# Verificar
nvim --version
```

#### Opción B: Desde repositorio oficial
```bash
sudo apt install neovim
```

### Paso 2: Hacer Backup de Configuración Existente (Importante)

```bash
# Hacer backup de configuración actual
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### Paso 3: Clonar Esta Configuración

```bash
git clone https://github.com/siryefers6/nvim.git ~/.config/nvim
cd ~/.config/nvim
```

### Paso 4: Instalación Automática

```bash
# Simplemente abrir Neovim - ¡todo se instalará automáticamente!
nvim
```

**¿Qué pasará?**
1. Lazy.nvim se descargará automáticamente
2. Todos los plugins se instalarán
3. Mason instalará los LSP servers automáticamente
4. Treesitter descargará los parsers necesarios

**Nota:** La primera vez puede tardar 2-5 minutos. ¡Sé paciente!

## 🔧 Configuración Post-Instalación

### Configurar GitHub Copilot

1. Abrir Neovim:
   ```bash
   nvim
   ```

2. Ejecutar el comando de autenticación:
   ```vim
   :Copilot auth
   ```

3. Seguir las instrucciones en pantalla:
   - Se abrirá un código de autenticación
   - Visitar la URL proporcionada
   - Pegar el código en GitHub
   - ¡Listo!

### Verificar LSP Servers

```vim
# Dentro de Neovim
:Mason
```

Deberías ver instalados:
- ✓ pyright (Python)
- ✓ typescript-language-server (JavaScript/TypeScript)
- ✓ html-lsp (HTML)
- ✓ css-lsp (CSS)
- ✓ lua-language-server (Lua)
- ✓ json-lsp (JSON)

### Instalar Herramientas de Formateo (Opcional pero Recomendado)

```bash
# Python
pip3 install black isort flake8

# JavaScript/TypeScript
npm install -g prettier eslint

# Lua
cargo install stylua  # Requiere Rust
```

## ⌨️ Atajos de Teclado Principales

### General
- `<Space>` - Tecla líder
- `<Space>w` - Guardar archivo
- `<Space>q` - Salir
- `<Space>h` - Limpiar resaltado de búsqueda

### Navegación de Ventanas
- `<C-h/j/k/l>` - Moverse entre ventanas
- `<C-Up/Down/Left/Right>` - Redimensionar ventanas

### Buffers
- `<S-h>` - Buffer anterior
- `<S-l>` - Siguiente buffer
- `<Space>bd` - Cerrar buffer

### LSP
- `gd` - Ir a definición
- `gr` - Buscar referencias
- `K` - Mostrar documentación
- `<Space>ca` - Acciones de código
- `<Space>rn` - Renombrar símbolo
- `<Space>f` - Formatear código
- `[d` / `]d` - Diagnóstico anterior/siguiente

### Telescope (Búsqueda)
- `<Space>pf` - Buscar archivos
- `<Space>ps` - Buscar texto en archivos
- `<Space>pp` - Archivos Git
- `<Space>pe` - Buffers abiertos
- `<Space>ph` - Ayuda de Neovim

### Autocompletado
- `<Tab>` - Siguiente sugerencia
- `<S-Tab>` - Sugerencia anterior
- `<CR>` - Confirmar selección
- `<C-Space>` - Forzar completado

### GitHub Copilot
- `<M-l>` (Alt+L) - Aceptar sugerencia
- `<M-]>` (Alt+]) - Siguiente sugerencia
- `<M-[>` (Alt+[) - Sugerencia anterior
- `<C-]>` - Descartar sugerencia

## 📁 Estructura del Proyecto

```
~/.config/nvim/
├── init.lua                    # Punto de entrada
├── lua/
│   ├── config/
│   │   ├── init.lua           # Carga toda la configuración
│   │   ├── settings.lua       # Opciones de Neovim
│   │   ├── keymaps.lua        # Atajos de teclado
│   │   ├── lazy.lua           # Configuración de lazy.nvim
│   │   └── plugins/
│   │       └── cmp.lua        # Configuración de autocompletado
│   └── plugins/               # Especificaciones de plugins
│       ├── lsp.lua            # LSP y Mason
│       ├── cmp.lua            # nvim-cmp
│       ├── tree-sitter.lua    # Treesitter
│       ├── telescope.lua      # Telescope
│       ├── copilot.lua        # GitHub Copilot
│       ├── lualine.lua        # Statusline
│       ├── gitsigns.lua       # Git decorations
│       └── ...
└── README.md                  # Este archivo
```

## 🐛 Solución de Problemas

### Problema: Plugins no se instalan

**Solución:**
```vim
:Lazy sync
```

### Problema: LSP no funciona

**Solución:**
```vim
:Mason
# Seleccionar el servidor faltante e instalar con 'i'
```

### Problema: Copilot no funciona

**Verificar:**
1. Node.js instalado: `node --version` (debe ser 18+)
2. Autenticado: `:Copilot status`
3. Re-autenticar si es necesario: `:Copilot auth`

### Problema: Errores de compilación en Treesitter

**Solución:**
```bash
# Instalar compilador
sudo apt install build-essential

# En Neovim
:TSUpdate
```

### Problema: Telescope no encuentra archivos

**Verificar ripgrep:**
```bash
rg --version
# Si no está instalado:
sudo apt install ripgrep
```

### Logs y Diagnósticos

```vim
# Ver estado de plugins
:Lazy

# Ver LSP logs
:LspInfo
:LspLog

# Ver estado de Treesitter
:TSInstallInfo

# Ver mensajes de error
:messages
```

## 🔄 Actualización

### Actualizar Plugins
```vim
:Lazy sync
```

### Actualizar LSP Servers
```vim
:Mason
# Presionar 'U' para actualizar todos
```

### Actualizar Configuración
```bash
cd ~/.config/nvim
git pull
```

## 🎨 Personalización

### Cambiar Tema
Editar `lua/plugins/colorscheme.lua`:
```lua
return {
  "tupreferencia/tu-tema",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("tu-tema")
  end,
}
```

### Agregar Nuevos LSP Servers
Editar `lua/plugins/lsp.lua` y agregar a `ensure_installed`:
```lua
ensure_installed = {
  "pyright",
  "ts_ls",
  "nuevo_servidor",
},
```

### Modificar Atajos de Teclado
Editar `lua/config/keymaps.lua`

## 📚 Recursos Adicionales

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## 🤝 Contribuir

¿Encontraste un bug o tienes una sugerencia? ¡Abre un issue o pull request!

## 📝 Licencia

MIT License - Libre para usar y modificar

## ⭐ Créditos

Esta configuración está basada en las mejores prácticas modernas de la comunidad Neovim.

---

**¡Disfruta de tu nueva configuración de Neovim!** 🎉

