#!/bin/bash

# === COLORES ===
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
RESET="\e[0m"

clear

echo -e "${YELLOW}Instalación de GIMP:${RESET}"
echo ""
sleep 1

# Detectar la distribución
DISTRO=$(source /etc/os-release && echo $ID)

# Función para instalar flatpak según la distro
instalar_flatpak() {
    case $DISTRO in
        ubuntu|debian|linuxmint)
            sudo apt update && sudo apt install flatpak -y ;;
        fedora)
            sudo dnf install flatpak -y ;;
        arch|manjaro)
            sudo pacman -Sy --noconfirm flatpak ;;
        opensuse*)
            sudo zypper install -y flatpak ;;
        *)
            echo -e "${RED}Distribución no reconocida. Por favor, instala Flatpak manualmente.${RESET}"
            exit 1 ;;
    esac
}

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
