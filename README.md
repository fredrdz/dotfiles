# Dotfiles
My dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Install via Chezmoi:
```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
```

The following script automatically runs to decrypt a passphrase via [Age](https://www.chezmoi.io/reference/commands/age/):
```sh
#!/bin/sh
DIR="${HOME}/.config/chezmoi"

if [ ! -f "${DIR}/chezmoi.key" ]; then
	mkdir -p "${DIR}"
	chezmoi age decrypt --output "${DIR}/chezmoi.key" --passphrase "{{ .chezmoi.sourceDir }}/chezmoi.key.age"
	chmod 600 "${DIR}/chezmoi.key"
	chezmoi decrypt "{{ .chezmoi.sourceDir }}/encrypted_dot_zshenv.age" >> "${HOME}/.zshenv"
fi
```

Then a pre-install script runs to install and use [Bitwarden Secrets](https://www.chezmoi.io/reference/templates/bitwarden-functions/bitwardenSecrets/).
