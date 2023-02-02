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

## Distrobox:
https://github.com/89luca89/distrobox
Useful for immutatable OSes.
```
# installing fedora 37 on steam deck
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/extras/install-podman | sh -s -- --prefix ~/.local
sudo /home/fdev
sudo chown deck:deck /home/fdev
distrobox create --image fedora:37 --name fdev --home /home/fdev
```

## ASTROVIM:
https://github.com/AstroNvim/AstroNvim/
```
nvim +PackerSync
```
### Backup Nvim Configs
```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### OH-MY-TMUX:
https://github.com/gpakosz/.tmux
### Backup Tmux Configs
```
mv ~/.tmux ~/.tmux.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.tmux.conf.local ~/.tmux.conf.local.bak
```
* installing plugins: <prefix> + I
* uninstalling plugins: <prefix> + Alt + u
* updating plugins: <prefix> + u

## Steam Deck:
### Accessing/Unlocking ROOT 
Does NOT persist through updates.
```
passwd
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Sy
sudo pacman -S <package>
sudo steamos-readonly enable
```
