#!/bin/bash

# === COLORES ===
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
RESET="\e[0m"

clear

echo -e "${YELLOW}Limpieza del sistema:${RESET}"

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

# Instalar BleachBit si no está
if ! command -v bleachbit &>/dev/null; then
    echo -e "${YELLOW}Instalando BleachBit...${RESET}"
    instalar_paquete bleachbit
fi

# Ejecutar limpieza automática
echo -e "${YELLOW}Ejecutando limpieza de paquetes innecesarios...${RESET}"
sudo apt autoremove -y

# Lanzar BleachBit
echo -e "${GREEN}Abriendo BleachBit para limpieza manual...${RESET}"
bleachbit &

echo -ne "\n${GREEN}Presiona Enter para volver al menú...${RESET}"
read
