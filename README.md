# github.com/fredrdz/dotfiles

Fredy Rodriguez dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Useful Chezmoi Commands:
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply fredrdz
chezmoi diff
chezmoi apply -v
chezmoi data
```

## Useful Github Commands:
```
ssh-keygen -t ed25519 -C "your_email@example.com"
git remote -v
git remote set-url origin git@github.com:fredrdz/dotfiles.git
```


## ASTROVIM:
https://github.com/AstroNvim/AstroNvim/

### Backup Nvim Configs
```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```
