#!/usr/bin/env bash
# Install prerequisite packages for kitchen-ci
set -euo pipefail

# Detect package manager

if command -v apt-get >/dev/null 2>&1; then
PKG_MANAGER="apt"
elif command -v dnf >/dev/null 2>&1; then
PKG_MANAGER="dnf"
elif command -v pacman >/dev/null 2>&1; then
PKG_MANAGER="pacman"
else
echo "Error: No supported package manager found (apt, dnf, pacman)."
exit 1
fi

echo "Using package manager: $PKG_MANAGER"

if [ "$PKG_MANAGER" = "apt" ]; then
sudo apt-get update
sudo apt-get install -y \
ansible \
podman \
python3 \
python3-pip \
python3.13-venv \
ruby \
ruby-dev \
bundler \
make \
gcc \
libyaml-dev

elif [ "$PKG_MANAGER" = "dnf" ]; then
sudo dnf install -y \
ansible \
podman \
python3 \
python3-pip \
ruby \
ruby-devel \
rubygem-bundler \
make \
gcc \
libyaml-devel

elif [ "$PKG_MANAGER" = "pacman" ]; then
sudo pacman -Sy --noconfirm \
ansible \
podman \
python \
python-pip \
ruby \
ruby-bundler \
base-devel \
libyaml
fi

# Optional: verify installations

echo "Verifying installations..."
python3 --version || true
pip3 --version || true
ruby --version || true
bundle --version || true
gcc --version || true

echo "All dependencies installed successfully."

