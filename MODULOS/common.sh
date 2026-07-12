#!/bin/bash
# Funciones y colores compartidos por los módulos de EasyNux.
# Se debe cargar con `source`, nunca ejecutar directamente.

# === COLORES ===
GREEN="\e[1;32m"
BLUE="\e[1;34m"
RED="\e[1;31m"
YELLOW="\e[1;33m"
CYAN="\e[1;36m"
PURPLE="\e[1;35m"
GRAY="\e[1;30m"
WHITE="\e[1;37m"
RESET="\e[0m"
NC="$RESET"

# === Detección de distro ===
DISTRO=$(source /etc/os-release && echo "$ID")

# Instala un paquete genérico con el gestor de la distro detectada
instalar_paquete() {
    case $DISTRO in
        ubuntu|debian|linuxmint)
            sudo apt update && sudo apt install -y "$1" ;;
        fedora)
            sudo dnf install -y "$1" ;;
        arch|manjaro)
            sudo pacman -Sy --noconfirm "$1" ;;
        opensuse*)
            sudo zypper install -y "$1" ;;
        *)
            echo -e "${RED}Distribución no soportada para instalación automática.${RESET}"
            return 1 ;;
    esac
}

# Instala Flatpak con el gestor de la distro detectada
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
