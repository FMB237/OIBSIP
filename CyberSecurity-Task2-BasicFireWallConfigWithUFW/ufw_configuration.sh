#!/bin/bash
# Author: FMB237
# Task 2: UFW Configuration Script

# Colors for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting ufw Configuration script...${NC}"

# 1. Resetting configs
echo -e "${GREEN}[1/5] Resetting ufw by force...${NC}"
sudo ufw --force reset 
sudo ufw default deny incoming 
sudo ufw default allow outgoing 
sleep 1

# 2. Allowing ssh connection
echo -e "${GREEN}[2/5] Allowing SSH Connection (Port 22)...${NC}"
sudo ufw allow ssh 
sleep 1

# 3. Deny http
echo -e "${GREEN}[3/5] Denying HTTP Requests (Port 80)...${NC}"
sudo ufw deny http
sleep 1

# 4. Adding Custom rules 
echo -e "${GREEN}[4/5] Applying Custom Security Rules...${NC}"
# Allow HTTPS (Port 443)
sudo ufw allow https 
# Block a simulated attacker IP (Changed from .1 to .50 to avoid lockout)
sudo ufw deny from 192.168.122.50 
sleep 1 

# 5. Enabling and Verification
echo -e "${GREEN}[5/5] Enabling Firewall and saving status...${NC}"
sudo ufw --force enable
sudo ufw status verbose > status.txt 

echo -e "${BLUE}Configuration Complete! Status saved to status.txt${NC}"