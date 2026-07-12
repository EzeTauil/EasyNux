#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

clear

echo -e "${YELLOW}Instalación de GIMP:${RESET}"
echo ""
sleep 1

# Verifica si flatpak está instalado
if ! command -v flatpak &> /dev/null; then
    echo -e "${YELLOW}Flatpak no está instalado. Instalando Flatpak...${RESET}"
    instalar_flatpak
fi

# Agrega Flathub si no está
if ! flatpak remote-list | grep -q flathub; then
    echo -e "${YELLOW}Agregando repositorio Flathub...${RESET}"
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Instalar GIMP
echo -e "${YELLOW}Instalando GIMP desde Flathub...${RESET}"
flatpak install flathub org.gimp.GIMP -y

# Confirmación
if flatpak list | grep -q org.gimp.GIMP; then
    echo -e "${GREEN}¡GIMP se ha instalado correctamente!${RESET}"
else
    echo -e "${RED}Ocurrió un error durante la instalación de GIMP.${RESET}"
fi

echo ""
echo -ne "${YELLOW}Presiona Enter para volver al menú...${RESET}"
read
