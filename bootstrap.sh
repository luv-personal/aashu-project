#!/bin/bash

# This script installs Docker and Docker Compose on Ubuntu

# Exit immediately if a command exits with a non-zero status
set -e

echo "🔧 Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo "📦 Installing required packages..."
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔑 Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📋 Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔁 Updating package index with Docker repo..."
sudo apt-get update

echo "🐳 Installing Docker Engine, CLI, and containerd..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "🧪 Verifying Docker installation..."
docker --version
docker compose version

echo "🎉 Docker and Docker Compose installed successfully!"
