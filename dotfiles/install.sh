#!/usr/bin/env bash
# Interactive installation & backup script

# Formatting variables for nice terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' #no color


echo -e "${BLUE}=========================================${NC}"
echo -e "${YELLOW}               Welcome!   ${NC}"
echo -e "${BLUE}=========================================${NC}"
echo -e "This script will isntall lightweight Wayland tools (tools, modules, to match your need. so answer some of the question after this)"
echo -e "and apply a <1GB RAM idle Hyprland configuration.\n"

# 1. Define standard lightweight packages
# We use kitty, waybar, fuzzel, swaync, hyprpaper, hyprlock, hypridle, wlogout
PACKAGES=(
    "hyprland" "foot" "grim" "wf-recorder" "waybar" "fuzzel" "swaync" 
    "hyprpaper" "hyprlock" "hypridle" "wlogout" 
    "ttf-jetbrains-mono-nerd" "papirus-icon-theme" "polkit-kde-agent"
)

# 2. Ask about hardware context
read -r -p "Are you installing this on a laptop? (y/n):" IS_LAPTOP
echo ""

if [[ "$IS_LAPTOP" =~ ^[Yy]$ ]]; then
    read -r -p "Is your laptop have battery? (y/n):" IS_BATTERY
    if [[ "$IS_BATTERY" =~ ^[Nn]$ ]]; then
        echo -e "\nYour laptop is always on plug? Same, tbh. So, you don't need the module to show battery status, good for u."
        echo -e "${YELLOW}However, your laptop may have brightness key so..."
        PACKAGES+=("brightnessctl")
        echo -e "${YELLOW}\n[!] Adding brightnessctl...${NC}"
    fi
    if [[ "$IS_BATTERY" =~ ^[Yy]$ ]]; then
    echo -e "So, your laptop has a battery... good for you >:-("
    PACKAGES+=("brightnessctl" "upower")
    echo -e "${YELLOW}[!] Adding brightnessctl and upower...${NC}"
    fi
fi

# 3. Installing the packages ong
echo -e "\n${BLUE}[*] Installing Packages...${NC}"
# Check if yay or paru is installed for AUR packages (if any are added later)
if command -v yay &> /dev/null; then
    yay -S needed "${PACKAGES[@]}"
elif command -v pacman &> /dev/null; then
    pacman -S needed "{PACKAGES[@]}"
else
    echo -e "${RED}[X] Neither pacman nor yay found, are you even on Arch?${NC}"
    exit 1
fi

# 4. Backup existing configurations
BACKUP_DIR="$HOME/.config/ramageddon-backups-$(date +%Y%m%d_%H%M%S)"
echo -e "\n${BLUE}[*] Creating backups in $BACKUP_DIR}... ${NC}"
mkdir -p "$BACKUP_DIR"

CONFIGS_TO_BACKUP=("hypr" "waybar" "fuzzel" "wlogout" "kitty" "swaync")

for config in "${CONFIGS_TO_BACKUP[@]}"; do
    if [ -d "$HOME/.config/$config" ]; then
        echo -e "${YELLOW}Backing up existing $config...${NC}"
        mv "$HOME/.config/$config" "$BACKUP_DIR/"
    fi
done

# 5. Copy new dotfiles
echo -e "\n${BLUE}[*] Copying Ramageddon dotfiles...${NC}"
# Assuming the scripts is run from the root fo the repop
cp -r dotfiles/* "$HOME/.config/"

# 6. Make scripts executable
echo -e "\n${BLUE}[*] Making utility scripts executable...${NC}"
chmod +x "$HOME/.config/hypr/scripts/"*sh

echo -e "\n${GREEN}[✔] Installation Complete!${NC}"
echo -e "Please log out and select 'Hyprland' from your display manager."
echo -e "NOTE: For the best ad-free experience, install Firefox with the 'uBlock Origin' and 'Multi-Account Containers' extensions."

