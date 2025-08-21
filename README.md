¡Claro! Para configurar **Neovim** con **Telescope**, **LSP** (Language Server Protocol) y **nvim-cmp** en un entorno Linux Ubuntu y trabajar con los lenguajes que mencionas, necesitas instalar las siguientes dependencias y configurarlas correctamente:

## Instalar nvim 0.11

# Instala asdf si no lo tienes:
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
source ~/.bashrc

# Instala el plugin de Neovim
asdf plugin-add neovim
asdf install neovim latest
asdf global neovim latest

# Verifica
nvim --version


### Dependencias generales

1. **Git**:
   - Necesario para descargar plugins.
     ```bash
     sudo apt install git
     ```

2. **Node.js y npm** (para lenguajes como JavaScript y soporte de algunos plugins):
   ```bash
   sudo apt install nodejs npm
   ```

3. **Python**:
   - Asegúrate de instalar Python y su módulo de soporte para Neovim:
     ```bash
     sudo apt install python3 python3-pip
     pip3 install pynvim
     ```

4. **Java (para Kotlin)**:
   - Kotlin necesita una JVM. Instala OpenJDK:
     ```bash
     sudo apt install openjdk-20-jdk
     ```

---

### Dependencias específicas para lenguajes

1. **Python**:
   - Instala el servidor de lenguaje **pyright**:
     ```bash
     npm install -g pyright
     ```

2. **Kotlin**:
   - Instala el servidor de lenguaje para Kotlin **kotlin-language-server**:
     ```bash
     sudo apt install default-jdk
     git clone https://github.com/fwcd/kotlin-language-server.git
     cd kotlin-language-server
     ./gradlew installDist
     ```

3. **JavaScript, HTML y CSS**:
   - Usa **vscode-langservers**:
     ```bash
     npm install -g vscode-langservers-extracted
     ```

4. **CSS LSP**:
   - Alternativamente, instala **css-languageserver**:
     ```bash
     npm install -g vscode-css-languageserver-bin
     ```

---

### Configuración de plugins en Neovim
Aquí tienes los plugins esenciales:
1. **Telescope**:
   - Asegúrate de instalarlo con todas las extensiones opcionales como `ripgrep`:
     ```bash
     sudo apt install ripgrep
     ```

### Instalar GitHub Copilot Neovim

1. Descargar Copilot:

```bash
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

2. Instalar nvm (gestor de versiones de Node.js):

Ejecuta este comando en tu terminal:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Ejecuta el siguiente comando para cargar nvm en tu terminal:
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

#### ✅ Verifica que se instaló bien:
```bash
nvm --version
```

---

### 🚀 Ahora sí, instalá Node.js 20

```bash
nvm install 20
nvm use 20
nvm alias default 20  # Opcional: lo deja como default
```

3. Ejecutar (si es windows)

```bash
wsl.exe --shutdown
```

4. Abrir nvim y ejecutar el comando `:Copilot setup`

5. Copiar código y pegarlo en el navegador para autenticarte.

