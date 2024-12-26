#!/bin/bash

# Color variables
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Clear the screen
clear

# Update the package list and redirect output to null
echo -e "${GREEN}Updating package list...${NC}"
sudo apt update > /dev/null 2>&1

# Upgrade the installed packages with detailed and animated output
echo -e "${GREEN}Upgrading installed packages...${NC}"
sudo apt upgrade -y 2>&1

# Remove unnecessary packages and clean up and redirect output to null
echo -e "${GREEN}Removing unnecessary packages and cleaning up...${NC}"
sudo apt autoremove -y > /dev/null 2>&1
sudo apt autoclean > /dev/null 2>&1

# Install boinc unattended-upgrade and fail2ban and redirect output to null
echo -e "${GREEN}Install boinc-client, unattended-upgrade, htop and fail2ban...${NC}"
sudo apt-get install boinc-client unattended-upgrades fail2ban htop -y > /dev/null 2>&1

# Start BOINC and redirect output to null
echo -e "${GREEN}Starting BOINC...${NC}"
sudo /etc/init.d/boinc-client start > /dev/null 2>&1

# Attach SiDock and WCG and redirect output to null
echo -e "${GREEN}Attach SiDock and WCG...${NC}"
boinccmd --project_attach https://www.sidock.si/sidock/ 6795_11e39ef7fbf8040ea1d42dfb515c9f3f && boinccmd --project_attach https://einsteinathome.org 3239f2eada8354f22327db9666f9e6d && boinccmd --project_attach https://www.worldcommunitygrid.org e2fe6c157cadd32dfdf6d9b180393afa > /dev/null 2>&1

echo -e "${YELLOW}Done!${NC}"

