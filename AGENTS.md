# AGENTS.md

**AI Agent Guide for Dotfiles Repository**

This is a [chezmoi](https://www.chezmoi.io/) dotfiles repository that manages configuration files across macOS, Fedora, and other Linux distributions. This guide helps AI agents understand the codebase structure, conventions, and workflows.

---

## Repository Type & Purpose

**Type:** Personal dotfiles managed with chezmoi  
**Primary Platforms:** macOS (darwin), Fedora Linux, Nobara Linux, Ubuntu  
**Editor:** Neovim with AstroNvim distro  
**Terminal:** Ghostty  
**Shell:** Zsh with Oh My Zsh

---

## Essential Chezmoi Commands

### Core Operations
```bash
# Apply dotfiles to system
chezmoi apply

# Apply with verbose output (useful for debugging)
chezmoi apply -v

# Show differences between local repo and applied files
chezmoi diff

# View computed template data (variables, OS detection, etc.)
chezmoi data --format=yaml

# Edit a file in the source state
chezmoi edit ~/.config/nvim/init.lua

# Add a new file to chezmoi
chezmoi add ~/.bashrc

# Update from git and apply
chezmoi update
```

### Troubleshooting Commands
```bash
# Force scripts to re-run
chezmoi state delete-bucket --bucket=entryState  # clear state of `run_onchange_` scripts
chezmoi state delete-bucket --bucket=scriptState # clear state of `run_once_` scripts

# Check which files chezmoi manages
chezmoi managed

# Verify configuration
chezmoi verify
```

### Testing Without Applying
```bash
# Dry run - show what would be applied
chezmoi apply --dry-run --verbose
```

---

## Repository Structure

### Core Chezmoi Files
- `.chezmoi.toml.tmpl` - Main chezmoi configuration with age encryption and OS detection
- `.chezmoiignore` - Files to exclude from management
- `.chezmoiexternal.toml` - External dependencies (oh-my-zsh, fzf, tmux plugins)
- `.chezmoiscripts/` - Automated setup and maintenance scripts

### Configuration Organization
> **Source:** Run `ls -la` or `tree` in the repository root to see the current structure.

Key directories:
- `dot_config/` - Maps to `~/.config/` (nvim, wezterm, aerospace, ghostty, lazygit, aichat, eza, etc.)
- `dot_script/` - Custom utility scripts
- `.chezmoiscripts/` - Setup and automation scripts

### Naming Conventions

**Chezmoi prefixes:**
- `dot_` → Creates file/dir starting with `.` (e.g., `dot_zshrc` → `~/.zshrc`)
- `private_` → Sets permissions to 0600 (private files)
- `encrypted_` → File encrypted with age
- `executable_` → Sets executable permissions
- `symlink_` → Creates symbolic link

**Script naming:**
- `run_once_*.sh` → Runs once during initial setup
- `run_once_before_*.sh` → Runs once before applying dotfiles
- `run_onchange_*.sh` → Runs when file content changes
- `run_*.sh` → Runs every time chezmoi apply is executed

---

## Security & Secrets Management

### Encryption
- **Method:** Age encryption
- **Files encrypted:** Sensitive credentials, API keys

### Secrets Manager
- **Primary:** Bitwarden Secrets Manager (bws)
- **Usage:** Templates use `bitwardenSecrets` function
- **Example:** `{{ (bitwardenSecrets "uuid").value }}`
- **Pre-hook:** Password manager installed before applying dotfiles

### Never Commit These Files
- Any file with real credentials
- `.env` files with actual secrets

---

## Template System

### Variables Available
```go
.chezmoi.os           // "darwin" or "linux"
.chezmoi.osRelease.id // "fedora", "nobara", etc.
.osid                 // Combined: "darwin" or "linux-fedora"
```

### Template Examples
```go
// OS-specific logic
{{ if eq .osid "darwin" }}
brew install package
{{ else if eq .osid "linux-fedora" }}
sudo dnf install package
{{ end }}

// Bitwarden secret
{{ (bitwardenSecrets "secret-uuid").value }}

// Include file content
{{ include "path/to/file" }}

// File hash for run_onchange scripts
# hash: {{ include "config.yaml" | sha256sum }}
```

---

## Neovim Configuration

### Editor Setup
- **Distro:** [AstroNvim v5](https://astronvim.com/)
- **Theme:** Kanagawa
- **Leader Key:** `Space`
- **Local Leader:** `,`
- **Plugin Manager:** [Lazy.nvim](https://github.com/folke/lazy.nvim)

### Configuration Structure
> **Source:** Run `tree dot_config/nvim/` or `ls -laR dot_config/nvim/` to see the current structure.

Key locations:
- `dot_config/nvim/init.lua` - Bootstrap lazy.nvim
- `dot_config/nvim/lua/lazy_setup.lua` - Lazy plugin configuration
- `dot_config/nvim/lua/polish.lua` - Custom filetype detection
- `dot_config/nvim/lua/community.lua` - AstroCommunity imports
- `dot_config/nvim/lua/plugins/` - Custom plugin configurations (astrocore, astrolsp, mason, etc.)

### Language Support (via AstroCommunity packs)
> **Source:** See `dot_config/nvim/lua/community.lua` for the full list of enabled packs and modules.

### Custom Filetype Detection
```lua
// .gohtml files → gohtml filetype
// .templ files → templ filetype
// .tmpl with shebang → bash/zsh/sh based on shebang
```

### Formatting Rules
- **Lua:** 2 spaces, line width 120, Unix line endings (stylua)
- **Go:** gci for imports, golines for line length
- **TypeScript/JS:** Prettier with single quotes, no semicolons
- **Format on save:** Enabled by default (see `astrolsp.lua`)

### Installed Tools (via Mason)
> **Source:** See `dot_config/nvim/lua/plugins/mason.lua` for the complete `ensure_installed` list.

---

## Package Management

> **Source:** See `.chezmoiscripts/run_once_install-packages.sh.tmpl` for all package installations.

The install script is OS-aware and contains functions for each package category:

### macOS (Homebrew)
- Development tools, terminal utilities, and casks are installed via `brew install`
- Window management: Aerospace + borders
- Fonts: JetBrains Mono Nerd Font, Monaspace Nerd Font

### Fedora/Nobara (DNF)
- Uses `packages-dnf()` function for system packages
- Enables Copr repos for lazygit and caddy
- Includes virtualization and desktop packages for Nobara

### Go Tools
> **Source:** See `packages-golang()` function in the install script.

### Rust Tools
> **Source:** See `packages-rust()` function in the install script.

### Node Tools
> **Source:** See `packages-node()` function in the install script.

---

## Git Configuration

### Settings
- **Default Branch:** main
- **Pager:** delta (with kanagawa theme, line numbers, hyperlinks)
- **Merge Strategy:** zdiff3
- **Pull Strategy:** rebase
- **URL Rewrite:** HTTPS → SSH for GitHub

### User Info
- Loaded from Bitwarden Secrets (see `dot_gitconfig.tmpl`)

### Git LFS
- Enabled and configured

---

## Shell Configuration

### Zsh Setup
- **Framework:** Oh My Zsh
- **Theme:** fino-time (with Starship prompt overriding in practice)
- **Prompt:** Starship
- **Auto-update:** Disabled (manual control)
- **Completion:** Enabled with corrections disabled

### Plugins Enabled
> **Source:** See `plugins=(...)` array in `dot_zshrc.tmpl` for the complete list.

### Custom Tools
- **zoxide:** Smart cd replacement
- **fzf:** Fuzzy finder (keybindings enabled)
- **eza:** Modern ls with color themes
- **bat:** Cat clone with syntax highlighting
- **delta:** Git diff viewer

---

## Code Style & Formatting

### Lua (Neovim, stylua)
> **Source:** See `dot_config/nvim/dot_stylua.toml` for the complete configuration.

### Prettier (JS/TS/HTML/CSS)
> **Source:** See `.prettierrc.toml` for the complete configuration.

### Go
- Use `gci` for import organization
- Use `golines` for line length (configured in Neovim)
- Format on save enabled (via gopls)

### Shell Scripts
- Use `shfmt` for formatting (2 space indent)
- Use `shellcheck` for linting
- Prefer `bash` for scripts, `zsh` for interactive

---

## Important Patterns & Conventions

### Editing Dotfiles
```bash
# NEVER edit files in ~/ directly - edit the source
chezmoi edit ~/.zshrc              # Opens source in $EDITOR
chezmoi apply                       # Apply changes

# Or edit directly in source directory
cd ~/.local/share/chezmoi
nvim dot_zshrc.tmpl
chezmoi apply
```

### Adding New Files
```bash
# Add existing file to chezmoi
chezmoi add ~/.config/app/config.toml

# Make file private (600 permissions)
chezmoi add --template ~/.ssh/config

# For secrets, use Bitwarden Secrets Manager
# Edit the template file and use {{ bitwardenSecrets "uuid" }}
```

### Platform-Specific Configuration
```go
// In .tmpl files, check OS
{{ if eq .osid "darwin" }}
// macOS-specific config
{{ else if eq .osid "linux-fedora" }}
// Fedora-specific config
{{ else }}
// Default config
{{ end }}
```

### Script Development
1. Create scripts in `.chezmoiscripts/`
2. Use appropriate prefix: `run_once_`, `run_onchange_`, etc.
3. For `run_onchange_`, include hash comment to trigger reruns
4. Test with `chezmoi apply --dry-run --verbose`

---

## Common Gotchas

### Chezmoi
- **Templates must have `.tmpl` extension** to be processed
- **Scripts run in order** based on prefix and name (alphabetical)
- **State is tracked** - scripts won't rerun unless forced or file changes
- **Symlinks** - Some configs use symlinks (e.g., tmux, aichat on macOS)
- **External archives refresh** every 168h (1 week) by default

### Neovim
- **AstroNvim v5 breaking changes** - Some plugins moved to community packs
- **none-ls.lua is disabled** by default (return {} at top of file)
- **Leader is Space** - most mappings start with Space
- **Formatting conflicts** - `lua_ls` formatting disabled in favor of stylua
- **Custom filetypes** - `.gohtml` and `.templ` have custom detection

### Git
- **HTTPS rewritten to SSH** - all GitHub URLs use SSH automatically
- **Bitwarden required** - git config won't apply without secrets manager
- **Rebase on pull** - default strategy is rebase, not merge

### Scripts
- **Interactive prompts** - Install scripts ask for confirmation
- **One-time execution** - Most scripts only run once (use state delete to rerun)
- **macOS symlinks** - aichat and lazygit configs symlinked to Library/Application Support

---

## Testing & Validation

### Before Committing
```bash
# Check what will change
chezmoi diff

# Validate templates
chezmoi data --format=yaml

# Test apply without changing files
chezmoi apply --dry-run --verbose

# Lint Lua files
stylua --check dot_config/nvim/

# Lint shell scripts
shellcheck .chezmoiscripts/*.sh
```

### Neovim Health Checks
```vim
:checkhealth                     " Full health check
:checkhealth lazy                " Check plugin manager
:checkhealth mason               " Check LSP installer
:checkhealth astrolsp            " Check LSP setup
```

---

## Workflow Guidelines

### Making Changes to Dotfiles
1. Navigate to source directory: `cd ~/.local/share/chezmoi`
2. Edit files directly or use `chezmoi edit <target>`
3. Test with `chezmoi diff` to see changes
4. Apply with `chezmoi apply`
5. Commit to git (but **never auto-commit/push** - disabled in config)

### Adding New Configuration
1. Create/edit file in source directory with proper chezmoi prefix
2. Use `.tmpl` extension if templates are needed
3. Add OS-specific logic if applicable
4. Test with `chezmoi apply --dry-run`
5. Apply and verify

### Updating External Dependencies
```bash
# Update oh-my-zsh, fzf, tmux plugins
chezmoi update --force

# Update Neovim plugins
nvim +Lazy sync +qa

# Update Go tools
go-global-update

# Update Cargo packages
cargo install-update -a

# Update npm global packages
npm-check-updates -g
```

### Troubleshooting
1. Check verbose output: `chezmoi apply -v`
2. Verify template data: `chezmoi data --format=yaml`
3. Check managed files: `chezmoi managed`
4. Clear script state if needed (see commands above)
5. Check logs in repo root: `noice.log`

---

## Development Tools

### Installed IDEs/Editors
- Neovim (primary)
- Visual Studio Code (macOS cask)

### Language Toolchains
- **Go:** 1.x via system package manager
- **Node.js:** v20+ via nvm/system
- **Rust:** via rustup (cargo available)
- **Python:** System python with ruff for linting/formatting
- **PHP:** System php with wp-cli

### Container Tools
- **Docker:** Installed on both macOS and Linux
- **Podman:** Available on Linux
- **Kind:** Kubernetes in Docker

---

## Project-Specific Context

### Author
- GitHub: fredrdz
- Install command: `sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply fredrdz`


### Window Management (macOS)
- **Primary:** Aerospace (tiling window manager)
- **Borders:** FelixKratz/borders for visual feedback
- Config: `dot_config/aerospace/aerospace.toml`

---

## Quick Reference

### Essential File Paths (in source)
```
dot_zshrc.tmpl                              # Shell config
dot_gitconfig.tmpl                          # Git config
dot_config/nvim/                            # Editor config
dot_config/ghostty/config                   # Terminal config
dot_config/starship.toml                    # Prompt config
.chezmoiscripts/run_once_install-packages.sh.tmpl  # Main installer
```

### Common Commands
```bash
# Chezmoi
chezmoi apply -v                # Apply with verbose output
chezmoi diff                    # See pending changes
chezmoi edit <file>             # Edit source file

# Git
git log --oneline -n 10         # Recent changes
git blame <file>                # See who changed what

# Neovim
nvim +Lazy                      # Open plugin manager
nvim +Mason                     # Open LSP installer
nvim +checkhealth               # Health check

# Updates
chezmoi update                  # Update dotfiles from git
go-global-update                # Update Go tools
cargo install-update -a         # Update Rust tools
brew upgrade                    # Update Homebrew packages (macOS)
```

---

## Additional Resources

- [Chezmoi Documentation](https://www.chezmoi.io/)
- [AstroNvim Documentation](https://astronvim.com/)
- [Repository README](./README.md)
- [Bitwarden Secrets CLI](https://bitwarden.com/help/secrets-manager-cli/)
- [Age Encryption](https://github.com/FiloSottile/age)

---

**Note:** This guide references source files instead of hardcoding values to prevent staleness.
