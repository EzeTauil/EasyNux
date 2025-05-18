#!/bin/bash

# === COLORES ===
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
RESET="\e[0m"

clear

echo -e "${YELLOW}Centro de Diagnóstico Avanzado:${RESET}"

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

while true; do
    echo ""
    echo -e "${CYAN}¿Qué herramienta deseas usar?${RESET}"
    echo "1) Ver temperatura del sistema (CPU/GPU)"
    echo "2) Test de velocidad de Internet"
    echo "3) Monitoreo en vivo"
    echo "4) Información extendida del sistema"
    echo "5) Volver al menú principal"
    echo -ne "${YELLOW}Selecciona una opción [1-5]: ${RESET}"
    read opcion

    case $opcion in
        1)
            if ! command -v sensors &>/dev/null; then
                echo -e "${YELLOW}Instalando lm-sensors...${RESET}"
                instalar_paquete lm-sensors
            fi
            echo -e "${GREEN}Ejecutando sensores:${RESET}"
            sensors
            ;;
        2)
            if ! command -v speedtest-cli &>/dev/null; then
                echo -e "${YELLOW}Instalando speedtest-cli...${RESET}"
                instalar_paquete speedtest-cli
            fi
            speedtest-cli
            ;;
        3)
            if ! command -v htop &>/dev/null; then
                echo -e "${YELLOW}Instalando htop...${RESET}"
                instalar_paquete htop
            fi
            htop
            ;;
        4)
            if ! command -v neofetch &>/dev/null; then
                echo -e "${YELLOW}Instalando Neofetch...${RESET}"
                instalar_paquete neofetch

            fi
            neofetch
            ;;
        5) break ;;
        *) echo -e "${RED}Opción inválida.${RESET}"; sleep 1 ;;
    esac

    echo -ne "\n${GREEN}Presiona Enter para continuar...${RESET}"
    read
    clear
    echo -e "${YELLOW}Centro de Diagnóstico Avanzado:${RESET}"
done
