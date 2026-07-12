#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

clear

echo -e "${YELLOW}Limpieza del sistema:${RESET}"

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
