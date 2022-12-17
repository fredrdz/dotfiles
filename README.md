# github.com/fredrdz/dotfiles

Fredy Rodriguez dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

### Useful Commands:
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply fredrdz
git remote -v
git remote set-url origin git@github.com:fredrdz/dotfiles.git
chezmoi diff
chezmoi apply -v
