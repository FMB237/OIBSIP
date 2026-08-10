#!/bin/bash

# ==============================================================================
# Script Name: install_docker.sh
# Description: Automates the installation of Docker Engine on Debian/Ubuntu-based 
#              systems (including Linux Mint and AntiX).
# Author: FMB237
# ==============================================================================

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 

echo -e "${BLUE}[*] Starting Docker Installation Process...${NC}"

# 1. Update system packages
echo -e "${GREEN}[1/5] Updating system packages...${NC}"
sudo apt-get update -y

# 2. Install prerequisite packages
echo -e "${GREEN}[2/5] Installing prerequisites...${NC}"
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 3. Add Docker's official GPG key
echo -e "${GREEN}[3/5] Adding Docker GPG key...${NC}"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg --yes

# 4. Set up the Docker repository
echo -e "${GREEN}[4/5] Setting up Docker repository...${NC}"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Install Docker Engine
echo -e "${GREEN}[5/5] Installing Docker Engine...${NC}"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Post-installation: Manage Docker as a non-root user
echo -e "${BLUE}[*] Configuring Docker for the current user...${NC}"
sudo usermod -aG docker $USER

echo -e "${BLUE}====================================================================${NC}"
echo -e "${GREEN}✅ Docker installation complete!${NC}"
echo -e "${BLUE}⚠️  IMPORTANT: Please log out and log back in (or run 'newgrp docker') for group changes to take effect.${NC}"
echo -e "${BLUE}====================================================================${NC}"
