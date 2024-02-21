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
# installing fedora latest via Distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
# optional: create custom home directory for container; if not Distrobox will use current $HOME
# I like placing it in /home to reduce confusion because otherwise it's going to overlap host dotfiles
sudo mkdir /home/fdev
sudo chown myuser:myuser /home/fdev
# w/ root and systemd, specific fedora release
distrobox create --image registry.fedoraproject.org/fedora:38 --name fdev --home /home/fdev --additional-packages "systemd" --init --root
# w/o root and systemd, on latest fedora release
distrobox create --image fedora:latest --name fdev --home /home/fdev
# enter container w/ root
distrobox enter --root fdev
# enter container w/o root
distrobox enter fdev
# enter container w/o root and start at container user home dir
distrobox enter --no-workdir --name fdev
```

### Release upgrade; Fedora 38 to 39 in this example
```bash
# inside container
sudo dnf update --refresh
sudo dnf system-upgrade download --releasever=39
sudo dnf system-upgrade reboot
# let reboot command fail
sudo dnf system-upgrade upgrade
# then restart the container in distrobox just in case
# post cleanup
sudo dnf system-upgrade clean
sudo dnf clean packages
```
### Example ssh config entry
```bash
# I usually create two entries; one w/o the remote cmd and another with it.
Host myhost
  Hostname 10.0.0.xx
  User myuser
  Port 22
  ProxyJump somehost
  IdentityFile ~/.ssh/mykey
  RemoteCommand distrobox enter --no-workdir --name fdev
  RequestTTY yes
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
