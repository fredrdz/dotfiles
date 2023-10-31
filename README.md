# github.com/fredrdz/dotfiles

Fredy Rodriguez dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Useful Chezmoi Commands

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply fredrdz
chezmoi diff
chezmoi apply -v
chezmoi data
```

## Useful Github Commands

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
git remote -v
git remote set-url origin git@github.com:fredrdz/dotfiles.git
```

## Distrobox

<https://github.com/89luca89/distrobox>
Useful for immutatable OSes.

```bash
# installing fedora latest on steam deck
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
sudo mkdir /home/fdev
sudo chown deck:deck /home/fdev
# w/ root and systemd, specific fedora release
distrobox create --image registry.fedoraproject.org/fedora:38 --name fdev --home /home/fdev --additional-packages "systemd" --init --root
# w/o root and systemd, on latest fedora release
distrobox create --image fedora:latest --name fdev --home /home/fdev
# enter container w/ root if used during image creation
distrobox enter --root fdev
distrobox enter fdev
```

## ASTROVIM

<https://github.com/AstroNvim/AstroNvim/>

```bash
nvim +PackerSync
```

### Backup Nvim Configs

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### OH-MY-TMUX

<https://github.com/gpakosz/.tmux>

### Backup Tmux Configs

```bash
mv ~/.tmux ~/.tmux.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.tmux.conf.local ~/.tmux.conf.local.bak
```

* installing plugins: `<prefix> + I`
* uninstalling plugins: `<prefix> + Alt + u`
* updating plugins: `<prefix> + u`

## Steam Deck

### Accessing/Unlocking ROOT

Does NOT persist through updates.

```bash
passwd
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Sy
sudo pacman -S <package>
sudo steamos-readonly enable
```
