#!/usr/bin/env bash
# Quick interactive setup script for Ubuntu 22.04
# Test with care

echo "Do you want to continue with installs?(yes/no)"
read -r input
if [ "$input" != "yes" ]; then
	exit
fi

echo "Enter the username for the target user; script will apply changes to this user."
read -r USERNAME

# --------------------------------------------------------------
# Init environment

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y \
	net-tools zsh btop jq iftop iotop gdu httpie unzip fontconfig fzf pass gnupg2 gpg bat fd-find zoxide \
	git binutils build-essential libwrap0-dev libssl-dev ca-certificates curl wget

# --------------------------------------------------------------
# Install ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
mkdir ~/.oh-my-zsh/completions/

# --------------------------------------------------------------
# Install eza

sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update -y
sudo apt install -y eza

# --------------------------------------------------------------
# Install gh (GitHub CLI)

type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
	sudo apt update -y &&
	sudo apt install gh -y

# --------------------------------------------------------------
# Install starship prompt
echo "Need to set a password for $USERNAME user to install starship prompt."
sudo passwd "$USERNAME"
curl -sS https://starship.rs/install.sh | sh

# --------------------------------------------------------------
# Install zoxide

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# --------------------------------------------------------------
# Install zsh syntax highlighting, zsh autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

# --------------------------------------------------------------
# Setup zsh aliases, plugins, bat

# Define the lines to append
PATH_TO_ADD="$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin"

# Define the target file
ZSHRC="$HOME/.zshrc"

# zsh plugins
# Define the search pattern
SEARCH_PATTERN="plugins=(git)"

# Define the replacement string
REPLACEMENT_TEXT="plugins=(\n  aws\n  docker\n  fzf\n  pass\n  fd\n  starship\n  zoxide\n  gh\n  git\n  git-auto-fetch\n  history-substring-search\n  httpie\n  ripgrep\n  sudo\n  tmux\n  wp-cli\n  zsh-syntax-highlighting\n  zsh-autosuggestions\n)"

# Use sed to replace the line in .zshrc
# macOS users might need to use gsed or adjust the sed command for compatibility
sed -i.bak "/$SEARCH_PATTERN/c\\
$REPLACEMENT_TEXT
" "$ZSHRC"

echo "Updated plugins in $ZSHRC."

# Check if .zshrc already contains the path, if not, append it
if ! grep -q "export PATH.*$PATH_TO_ADD" "$ZSHRC"; then
	echo "Adding $PATH_TO_ADD to PATH in $ZSHRC"
	echo "export PATH=\$PATH:$PATH_TO_ADD" >>"$ZSHRC"
else
	echo "$PATH_TO_ADD is already in the PATH in $ZSHRC"
fi

# Define aliases to add
aliases=(
	"alias ls='ls --color=auto'"
	"alias la='ls -A --color=auto'"
	"alias l='ls -lhsF --color=auto --group-directories-first'"
	"alias ll='ls -lAhsF --color=auto --group-directories-first'"
	"alias e='eza --icons --group-directories-first --color=always'"
	"alias el='eza --oneline --icons --group-directories-first --color=always'"
	"alias ela='eza --oneline --icons --group-directories-first --color=always --all'"
	"alias es='eza --git --long --icons --group-directories-first --color=always --header'"
	"alias esa='eza --git --long --icons --group-directories-first --color=always --header --all'"
	"alias est='eza --git --long --tree --level 1 --icons --group-directories-first --color=always --header --all'"
	"alias b='bat --style=full --paging=never --force-colorization'"
	"alias v='nvim'"
)

# Loop through each alias and add it to .zshrc if it doesn't already exist
for alias_cmd in "${aliases[@]}"; do
	if ! grep -Fxq "$alias_cmd" "$ZSHRC"; then
		echo "$alias_cmd" >>"$ZSHRC"
		echo "Added: $alias_cmd"
	else
		echo "Already exists: $alias_cmd"
	fi
done

echo "All specified aliases have been processed."

# symlink batcat to bat; due to package name conflicts on ubuntu
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# --------------------------------------------------------------
# nerd-fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip -P ~/init-setup/
mkdir -p ~/.local/share/fonts
unzip ~/init-setup/JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -v ~/.local/share/fonts

# --------------------------------------------------------------
# xterm-256color-italic

curl --silent \
	https://gist.githubusercontent.com/sadsfae/0b4dd18670639f7dce941a1b2a9e4e9e/raw/908b48e6b6370da0568be8d138966c60240a50dd/xterm-256color-italic.terminfo \
	>~/init-setup/xterm-256color-italic
tic ~/init-setup/xterm-256color-italic

# --------------------------------------------------------------
# Install latest neovim using bob: https://github.com/MordechaiHadad/bob

gh release download --repo MordechaiHadad/bob --pattern "*linux-x86_64.zip" --output ~/init-setup/bob.zip
unzip ~/init-setup/bob.zip -d ~/.local/bin/
chmod +x ~/.local/bin/bob
~/.local/bin/bob use stable

# --------------------------------------------------------------
# Setup default Astrovim

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim --headless +q

# --------------------------------------------------------------
# timezone

sudo timedatectl set-timezone America/Chicago

# --------------------------------------------------------------
# Install efs client

cd ~/init-setup || exit 1
git clone https://github.com/aws/efs-utils ~/init-setup/efs-utils
cd ./efs-utils || exit 1
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb

# install stunnel
cd ~/init-setup || exit 1
curl -o stunnel-latest.tar.gz https://www.stunnel.org/downloads/stunnel-latest.tar.gz
tar xvfz stunnel-latest.tar.gz
cd stunnel-latest/ || exit 1
sudo ./configure
sudo make
sudo rm /bin/stunnel
sudo make install
sudo ln -s /usr/local/bin/stunnel /bin/stunnel
cd ~/init-setup || exit 1

# mount efs
# replace fs-011cf0fb9911f8710 with your efs id
sudo mount -t efs -o tls fs-011cf0fb9911f8710:/ efs

# --------------------------------------------------------------
# Docker install

# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
	sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# --------------------------------------------------------------
# Post-installation steps for Docker

sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# --------------------------------------------------------------
# Install docker credential helper

docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --use
docker buildx bake "https://github.com/docker/docker-credential-helpers.git"
sudo mv ./bin/build/linux_amd64/docker-credential-pass /usr/local/bin/
rm -r ./bin

# --------------------------------------------------------------
# Configure pass
# https://github.com/docker/docker-credential-helpers/issues/102

echo "Need to generate a new gpg key for pass."
gpg2 --gen-key
KEY_ID=$(gpg2 --list-keys --with-colons | tail -1 | awk -F: '{print $10}')
pass init "$KEY_ID"
sed -i '0,/{/s/{/{\n\t"credsStore": "pass",/' ~/.docker/config.json
docker login ghcr.io

# --------------------------------------------------------------
# Change shell

sudo chsh -s "$(which zsh)" "$USERNAME"
echo "Please logout and login again to use zsh as default shell"
