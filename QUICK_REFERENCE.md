# Neovim Quick Reference Card

## 🚀 Primeros Pasos

### Abrir Neovim
```bash
nvim                    # Abrir en directorio actual
nvim archivo.py         # Abrir archivo específico
nvim .                  # Abrir explorador de archivos
```

### Salir de Neovim
- `:q` - Salir (si no hay cambios)
- `:q!` - Salir sin guardar
- `:wq` - Guardar y salir
- `<Space>q` - Atajo rápido para salir

## 📝 Edición Básica

### Modos
- `i` - Modo inserción (antes del cursor)
- `a` - Modo inserción (después del cursor)
- `o` - Nueva línea abajo y modo inserción
- `O` - Nueva línea arriba y modo inserción
- `Esc` - Volver a modo normal
- `v` - Modo visual (selección)
- `V` - Modo visual línea
- `Ctrl+v` - Modo visual bloque

### Guardar
- `:w` - Guardar
- `<Space>w` - Guardar (atajo)
- `:wa` - Guardar todos los buffers

### Copiar/Pegar
- `yy` - Copiar línea
- `dd` - Cortar línea
- `p` - Pegar después
- `P` - Pegar antes

## 🔍 Búsqueda y Navegación

### Telescope (Buscador Fuzzy)
- `<Space>pf` - Buscar archivos
- `<Space>ps` - Buscar texto en archivos
- `<Space>pp` - Archivos Git
- `<Space>pe` - Buffers abiertos
- `<Space>ph` - Ayuda de Neovim
- `<Space>bb` - Explorador de archivos

### Navegación en Archivo
- `gg` - Ir al inicio
- `G` - Ir al final
- `0` - Inicio de línea
- `$` - Final de línea
- `w` - Siguiente palabra
- `b` - Palabra anterior
- `{` - Párrafo anterior
- `}` - Siguiente párrafo

### Búsqueda en Archivo
- `/texto` - Buscar hacia adelante
- `?texto` - Buscar hacia atrás
- `n` - Siguiente resultado (centrado)
- `N` - Resultado anterior (centrado)
- `<Space>h` - Limpiar resaltado

## 🪟 Ventanas y Buffers

### Dividir Ventanas
- `:split` o `:sp` - División horizontal
- `:vsplit` o `:vs` - División vertical

### Navegar entre Ventanas
- `Ctrl+h` - Ventana izquierda
- `Ctrl+j` - Ventana abajo
- `Ctrl+k` - Ventana arriba
- `Ctrl+l` - Ventana derecha

### Redimensionar Ventanas
- `Ctrl+Up` - Aumentar altura
- `Ctrl+Down` - Disminuir altura
- `Ctrl+Left` - Disminuir ancho
- `Ctrl+Right` - Aumentar ancho

### Buffers
- `Shift+h` - Buffer anterior
- `Shift+l` - Siguiente buffer
- `<Space>bd` - Cerrar buffer
- `<Space>pe` - Listar buffers (Telescope)

## 🔧 LSP (Programación)

### Navegación de Código
- `gd` - Ir a definición
- `gD` - Ir a declaración
- `gi` - Ir a implementación
- `gr` - Buscar referencias
- `gt` - Ir a definición de tipo
- `K` - Mostrar documentación
- `Ctrl+k` - Ayuda de firma

### Acciones de Código
- `<Space>ca` - Acciones de código
- `<Space>rn` - Renombrar símbolo
- `<Space>f` - Formatear código

### Diagnósticos
- `[d` - Diagnóstico anterior
- `]d` - Diagnóstico siguiente
- `<Space>e` - Mostrar diagnóstico
- `<Space>dl` - Lista de diagnósticos

## 🤖 GitHub Copilot

### Sugerencias
- `Alt+l` - Aceptar sugerencia
- `Alt+]` - Siguiente sugerencia
- `Alt+[` - Sugerencia anterior
- `Ctrl+]` - Descartar sugerencia

### Comandos
- `:Copilot status` - Ver estado
- `:Copilot auth` - Autenticar
- `:Copilot panel` - Abrir panel

## ✍️ Autocompletado

### En Modo Inserción
- `Ctrl+Space` - Forzar autocompletado
- `Tab` - Siguiente sugerencia
- `Shift+Tab` - Sugerencia anterior
- `Enter` - Confirmar selección
- `Ctrl+e` - Cancelar

### Navegación en Menú
- `Ctrl+b` - Scroll arriba en docs
- `Ctrl+f` - Scroll abajo en docs

## 🎨 Comandos Útiles

### Comandos de Neovim
- `:Mason` - Gestionar LSP servers
- `:Lazy` - Gestionar plugins
- `:TSUpdate` - Actualizar Treesitter
- `:checkhealth` - Verificar estado
- `:LspInfo` - Info de LSP
- `:messages` - Ver mensajes

### Configuración
- `<Space>rr` - Recargar configuración

## 🔄 Modo Visual

### Selección
- `v` - Modo visual
- `V` - Selección de línea
- `Ctrl+v` - Selección de bloque

### En Modo Visual
- `y` - Copiar selección
- `d` - Cortar selección
- `>` - Indentar derecha
- `<` - Indentar izquierda
- `J` - Mover texto abajo
- `K` - Mover texto arriba

## 🌳 Treesitter Text Objects

### Seleccionar
- `vaf` - Seleccionar función (outer)
- `vif` - Seleccionar función (inner)
- `vac` - Seleccionar clase (outer)
- `vic` - Seleccionar clase (inner)
- `val` - Seleccionar loop (outer)
- `vil` - Seleccionar loop (inner)
- `vao` - Seleccionar condicional (outer)
- `vio` - Seleccionar condicional (inner)

### Navegar
- `]f` - Siguiente función
- `[f` - Función anterior
- `]c` - Siguiente clase
- `[c` - Clase anterior

## 🐛 Troubleshooting Rápido

### Plugin no funciona
```vim
:Lazy sync
```

### LSP no funciona
```vim
:Mason
" Instalar servidor faltante con 'i'
```

### Treesitter error
```vim
:TSUpdate
```

### Ver errores
```vim
:messages
```

### Verificar estado general
```vim
:checkhealth
```

## 💡 Tips Profesionales

### Repetir Último Comando
- `.` - Repetir última acción

### Deshacer/Rehacer
- `u` - Deshacer
- `Ctrl+r` - Rehacer

### Macros
- `qa` - Grabar macro en registro 'a'
- `q` - Detener grabación
- `@a` - Ejecutar macro 'a'
- `@@` - Repetir última macro

### Marcadores
- `ma` - Crear marca 'a'
- `'a` - Ir a marca 'a'
- `:marks` - Listar marcas

### Registros
- `"ayy` - Copiar línea en registro 'a'
- `"ap` - Pegar desde registro 'a'
- `:registers` - Ver registros

## 🎯 Flujo de Trabajo Típico

1. **Abrir Proyecto**: `nvim` en directorio
2. **Buscar Archivo**: `<Space>pf`
3. **Editar Código**: `i` para insertar
4. **Autocompletar**: `Tab` / `Enter`
5. **Ir a Definición**: `gd`
6. **Formatear**: `<Space>f`
7. **Guardar**: `<Space>w`
8. **Buscar en Proyecto**: `<Space>ps`
9. **Cambiar Buffer**: `Shift+h/l`
10. **Salir**: `<Space>q`

## 📱 Atajos de Emergencia

- `Ctrl+c` - Cancelar operación (como Esc)
- `:q!` - Salir sin guardar (forzar)
- `:e!` - Recargar archivo (descartar cambios)
- `:earlier 10m` - Volver 10 minutos atrás
- `:later 10m` - Adelantar 10 minutos

---

**¡Guarda esta referencia! 📌**

Para ayuda detallada: `:help <comando>`
Ejemplo: `:help navigation`
