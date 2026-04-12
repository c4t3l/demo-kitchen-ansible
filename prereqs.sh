#!/usr/bin/env bash
# Install prerequisite packages for kitchen-ci
# vim: set ts=4 sw=4 et:
set -euo pipefail

# Detect package manager
source /etc/os-release

if [ $ID = "debian" ]; then
    PKG_MANAGER="apt"
elif [ $ID = "fedora" ]; then
    PKG_MANAGER="dnf"
elif [ $ID = "arch" ]; then
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
    tox \
    ruby \
    ruby-dev \
    bundler \
    make \
    gcc \
    libyaml-dev \
    qemu-utils \
    qemu-system-x86 \
    # kiwi #(in unstable/Sid)

elif [ "$PKG_MANAGER" = "dnf" ]; then
    sudo dnf install -y \
    ansible \
    podman \
    python3 \
    python3-pip \
    python3-tox \
    ruby \
    ruby-devel \
    rubygem-bundler \
    make \
    gcc \
    libyaml-devel \
    qemu-system \
    qemu-img \
    kiwi-cli

elif [ "$PKG_MANAGER" = "pacman" ]; then
    sudo pacman -Sy --noconfirm \
    ansible \
    podman \
    python \
    python-pip \
    python-tox \
    ruby \
    ruby-bundler \
    base-devel \
    libyaml \
    qemu-base \
    # kiwi-ng #(in AUR)
fi


echo "Verifying installations..."
python3 --version || true
pip3 --version || true
tox --version || true
ruby --version || true
bundle --version || true
gcc --version || true

echo "All dependencies installed successfully."

