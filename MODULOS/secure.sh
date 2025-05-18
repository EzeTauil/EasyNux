#!/bin/bash

# === COLORES ===
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
RESET="\e[0m"

clear

# Detectar distro
DISTRO=$(source /etc/os-release && echo $ID)
instalar_paquete() {
    case $DISTRO in
        ubuntu|debian|linuxmint)
            sudo apt update && sudo apt install -y $1 ;;
        fedora)
            sudo dnf install -y $1 ;;
        arch|manjaro)
            sudo pacman -Sy --noconfirm $1 ;;
        opensuse*)
            sudo zypper install -y $1 ;;
        *)
            echo -e "${RED}Distribución no soportada para instalación automática.${RESET}" ;;
    esac
}

# === OPCIÓN 1: Activar y configurar firewall (UFW) ===
echo -e "${YELLOW}Activando y configurando el firewall UFW...${RESET}"

if ! command -v ufw &>/dev/null; then
    echo -e "${YELLOW}Instalando UFW...${RESET}"
    instalar_paquete ufw
fi

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose

echo -e "\n${GREEN}Firewall activado y configurado correctamente.${RESET}"
echo -ne "\n${YELLOW}Presiona Enter para volver al menú...${RESET}"
read
