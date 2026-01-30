# Installation Verification Checklist

Use this checklist to verify your Neovim configuration is working correctly.

## Pre-Installation Checklist

- [ ] Neovim version 0.9.0 or higher installed
  - Run: `nvim --version`
  - First line should show `NVIM v0.9.0` or higher

- [ ] Git installed
  - Run: `git --version`

- [ ] Node.js 18+ installed
  - Run: `node --version`
  - Should show `v18.x.x` or higher

- [ ] Python 3.8+ installed
  - Run: `python3 --version`

- [ ] Ripgrep installed (for Telescope)
  - Run: `rg --version`

- [ ] Build tools installed
  - Run: `gcc --version` or `cc --version`

## Post-Installation Checklist

### Step 1: Initial Load
- [ ] Open Neovim: `nvim`
- [ ] Wait for plugins to install (2-5 minutes)
- [ ] No errors shown during installation
- [ ] Run `:checkhealth` - review any errors

### Step 2: Verify Lazy.nvim
- [ ] Run `:Lazy` in Neovim
- [ ] All plugins show as installed (green checkmark)
- [ ] No red errors or warnings
- [ ] Copilot.lua should be listed

### Step 3: Verify Mason (LSP Servers)
- [ ] Run `:Mason` in Neovim
- [ ] Following servers should be installed:
  - [ ] pyright
  - [ ] typescript-language-server
  - [ ] html-lsp
  - [ ] css-lsp
  - [ ] lua-language-server
  - [ ] json-lsp

### Step 4: Verify Treesitter
- [ ] Run `:TSInstallInfo` in Neovim
- [ ] Following parsers should be installed:
  - [ ] python
  - [ ] javascript
  - [ ] typescript
  - [ ] html
  - [ ] css
  - [ ] lua
  - [ ] json

### Step 5: Test Python LSP
- [ ] Create a test file: `nvim test.py`
- [ ] Type: `def hello():`
- [ ] Press Enter and type a few spaces
- [ ] Autocompletion menu should appear
- [ ] Hover over a function with `K` to see documentation
- [ ] Test goto definition with `gd`

### Step 6: Test JavaScript/TypeScript LSP
- [ ] Create a test file: `nvim test.js`
- [ ] Type: `function test() {`
- [ ] Autocompletion should work
- [ ] Syntax highlighting should be correct

### Step 7: Test HTML LSP
- [ ] Create a test file: `nvim test.html`
- [ ] Type: `<!DOCTYPE html>`
- [ ] Type: `<div>` - should auto-close to `<div></div>`
- [ ] HTML tags should have syntax highlighting
- [ ] Tag completion should work

### Step 8: Test CSS LSP
- [ ] Create a test file: `nvim test.css`
- [ ] Type: `.class {`
- [ ] CSS property completion should work
- [ ] Color highlighting should work

### Step 9: Test Telescope
- [ ] Open Neovim in a directory with files
- [ ] Press `<Space>pf` (leader + pf)
- [ ] Telescope file finder should open
- [ ] Type to filter files
- [ ] Press Enter to open a file

### Step 10: Test Copilot
- [ ] Run `:Copilot auth` in Neovim
- [ ] Follow authentication steps
- [ ] Open a code file
- [ ] Start typing code
- [ ] Gray suggestion text should appear
- [ ] Press `Alt+l` to accept suggestion

### Step 11: Test Core Features
- [ ] Split windows work: `:vsplit` and `Ctrl+h/l` to navigate
- [ ] Buffers work: `:bnext` and `:bprev` or `Shift+h/l`
- [ ] Git signs show in sign column (if in git repo)
- [ ] Status line shows at bottom
- [ ] File explorer works: `<Space>bb`

## Troubleshooting

### If plugins don't install:
1. Check internet connection
2. Run `:Lazy sync` to retry
3. Check `:messages` for errors

### If LSP doesn't work:
1. Run `:LspInfo` to see status
2. Run `:Mason` and manually install servers
3. Restart Neovim
4. Run `:checkhealth lsp`

### If Copilot doesn't work:
1. Verify Node.js: `node --version` (must be 18+)
2. Run `:Copilot status`
3. Re-authenticate: `:Copilot auth`
4. Check `:messages` for errors

### If Treesitter errors:
1. Install build tools: `sudo apt install build-essential`
2. Run `:TSUpdate`
3. Restart Neovim

### General debugging:
1. Run `:checkhealth` for full system check
2. Check `:messages` for error messages
3. Look at log files in `~/.local/state/nvim/`

## Success Criteria

✅ Your installation is successful if:
- All plugins load without errors
- LSP works for Python, JavaScript, HTML, and CSS
- Autocompletion appears when typing
- Treesitter provides syntax highlighting
- Telescope file finder works
- GitHub Copilot provides suggestions
- No critical errors in `:checkhealth`

## Need Help?

If you encounter issues:
1. Check the README.md troubleshooting section
2. Run `:checkhealth` and review warnings
3. Check plugin documentation
4. Open an issue on GitHub with error messages

## Notes

Record any issues or customizations here:

_______________________________________________
_______________________________________________
_______________________________________________
_______________________________________________
