# Dotfiles
My dotfiles, managed with:
- [`Chezmoi`](https://www.chezmoi.io/).
- [`Bitwarden Secrets`](https://bitwarden.com/products/secrets-manager/).
- [`Age`](https://github.com/FiloSottile/age).

Install via Chezmoi:
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
```

The following script automatically runs to decrypt a passphrase via [age](https://www.chezmoi.io/reference/commands/age/):
<details>
<summary>View Script</summary>
https://github.com/fredrdz/dotfiles/blob/2a1ee28c59af717fb72be880b33189cee465e395/.chezmoiscripts/run_once_before_decrypt-private-key.sh.tmpl
</details>

Then a pre-install script runs to install and use [Bitwarden Secrets](https://www.chezmoi.io/reference/templates/bitwarden-functions/bitwardenSecrets/).

<details>
<summary>View Script</summary>
https://github.com/fredrdz/dotfiles/blob/main/.chezmoiscripts/run_once_before_install-password-manager.sh
</details>
