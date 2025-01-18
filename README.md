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
https://github.com/fredrdz/dotfiles/blob/cd37898c2badb3ff5e30c3bb51ae824693aa2d46/.chezmoiscripts/run_once_before_decrypt-private-key.sh.tmpl#L1-L9
</details>

Then a pre-install script runs to install and use [Bitwarden Secrets](https://www.chezmoi.io/reference/templates/bitwarden-functions/bitwardenSecrets/).

<details>
<summary>View Script</summary>
https://github.com/fredrdz/dotfiles/blob/cd37898c2badb3ff5e30c3bb51ae824693aa2d46/.chezmoiscripts/run_once_before_install-password-manager.sh#L1-L52
</details>
