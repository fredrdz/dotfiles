# Dotfiles
My dotfiles, managed with:
- [`Chezmoi`](https://www.chezmoi.io/)
- [`Bitwarden Secrets`](https://bitwarden.com/products/secrets-manager/)
- [`Age`](https://github.com/FiloSottile/age)

<!-- <p align="center"> -->
<!-- <img width="1840" alt="Screenshot 2025-01-21 at 16 50 30" src="https://github.com/fredrdz/dotfiles/assets/"> -->
<!-- </p> -->

## Editor: [Neovim](https://neovim.io/) [[config](./dot_config/nvim)]

- Distro: [AstroNvim](https://astronvim.com/)
- Theme: [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- Leader: `Ctrl+Space`

## Terminal: [Wezterm](https://wezfurlong.org/wezterm/index.html) [[config](./dot_config/wezterm)]

- Font: JetBrains Mono
- Theme: [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- Leader: `Ctrl+Shift`

## Shell: [Zsh](https://www.zsh.org/) [[config](./dot_zshrc.tmpl)]

- Prompt: [Starship](https://github.com/starship/starship) [[config](./dot_config/starship.toml)]
- MacOS Package manager: [homebrew](https://github.com/homebrew)
- Fedora Package manager: [dnf](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)

## How I install via Chezmoi.
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply fredrdz
```

This will install Chezmoi via the appropriate package manager and immediately pull down the dotfiles repo to `~/.local/share/chezmoi/`. Then it will apply the dotfiles to the system.
## How I have my Chezmoi configured.

The following happens as part of `--apply`:
1. Pre-install scripts execute.
  - A secrets manager is installed if not found.
  - Primary decryption occurs to enable the secrets manager used as the secondary layer of security.
2. Install script executes.
  - The main install scripts runs which installs my apps + setups my environment.

> 💡 **Notice:** The above mentioned scripts only execute once during the initial install since they are labeled with `run_once_`. Only scripts labeled as `run_onchange_` or `run_` may run multiple times. For more info: [`Chezmoi Scripts`](https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/).


### This script automatically runs to decrypt a passphrase via the [`chezmoi age` command](https://www.chezmoi.io/reference/commands/age/).
<details>
<summary>View Script</summary>
https://github.com/fredrdz/dotfiles/blob/cd37898c2badb3ff5e30c3bb51ae824693aa2d46/.chezmoiscripts/run_once_before_decrypt-private-key.sh.tmpl#L1-L9
</details>

### This pre-install script runs to install and use [Bitwarden Secrets](https://www.chezmoi.io/reference/templates/bitwarden-functions/bitwardenSecrets/).

<details>
<summary>View Script</summary>
https://github.com/fredrdz/dotfiles/blob/cd37898c2badb3ff5e30c3bb51ae824693aa2d46/.chezmoiscripts/run_once_before_install-password-manager.sh#L1-L52
</details>

### This main install script executes after the pre-install scripts to setup my environment.

<details>
<summary>View Script</summary>
https://github.com/fredrdz/dotfiles/blob/84856a336dd31eec2737a00137f017569ea571ea/.chezmoiscripts/run_once_install-packages.sh.tmpl#L1-L271
</details>

## Some useful commands for troubleshooting.

```sh
chezmoi apply -v # apply with verbose output
chezmoi diff     # diff between local repo and what's applied to the system
chezmoi data --format=yaml # writes the computed template data to stdout
# force scripts to re-run
chezmoi state delete-bucket --bucket=entryState  # clear state of `run_onchange_` scripts
chezmoi state delete-bucket --bucket=scriptState # clear state of `run_once_` scripts
```

Link to the available [Chezmoi commands](https://www.chezmoi.io/reference/commands/).
