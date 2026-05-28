#!/bin/bash
set -e

echo "=> Copying dotfiles..."
mkdir -p ~/.config
mkdir -p ~/.tmux

# Copy files instead of symlinking
cp ~/Dev/dotfiles/.zshrc ~/.zshrc
cp ~/Dev/dotfiles/tmux/.tmux.conf ~/.tmux.conf
rm -rf ~/.config/helix
cp -r ~/Dev/dotfiles/helix ~/.config/helix

echo "=> Installing NVM and Node.js (LTS)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

echo "=> Installing global npm packages..."
npm install -g typescript typescript-language-server prettier

echo "=> Installing Golang (go1.26.3)..."
if ! command -v go &> /dev/null; then
    curl -sfL -o /tmp/go1.26.3.linux-amd64.tar.gz https://go.dev/dl/go1.26.3.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf /tmp/go1.26.3.linux-amd64.tar.gz
    rm /tmp/go1.26.3.linux-amd64.tar.gz
else
    echo "Golang already installed."
fi

echo "=> Installing Podman (rootless)..."
if ! command -v podman &> /dev/null; then
    sudo apt-get update
    sudo apt-get -y install podman uidmap slirp4netns
else
    echo "Podman already installed."
fi

echo "=> Done! Your environment is ready."
echo "=> Please restart your terminal or run 'source ~/.zshrc'"
