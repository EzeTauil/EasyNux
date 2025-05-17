#!/bin/bash

# Creado por BlackSec

# === COLORES ===
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' 

clear
echo -e "${YELLOW}Instalación de componentes esenciales:${NC}"
echo ""
echo "Esta opción instalará herramientas fundamentales para mejorar la experiencia de uso:"
echo ""
echo "- wget: descarga de archivos desde internet"
echo "- curl: conexiones a servidores web"
echo "- git: gestión de proyectos y repositorios"
echo "- python3 y pip: ejecución de scripts y programas Python"
echo "- build-essential/base-devel: compilación de programas"
echo "- flatpak: instalación de aplicaciones universales"
echo "- htop: monitor de recursos"
echo ""
read -p "¿Desea continuar con la instalación? (s/n): " respuesta

if [[ "$respuesta" =~ ^[sS]$ ]]; then
    echo -e "${YELLOW}Iniciando instalación de componentes esenciales...${NC}"
    sleep 2

    instalar_apt() {
        sudo apt update
        sudo apt install -y wget curl git python3 python3-pip build-essential flatpak htop
    }

    instalar_pacman() {
        sudo pacman -Syu --noconfirm
        sudo pacman -S --noconfirm wget curl git python python-pip base-devel flatpak htop
    }

    instalar_dnf() {
        sudo dnf upgrade --refresh -y
        sudo dnf install -y wget curl git python3 python3-pip @development-tools flatpak htop
    }

    instalar_zypper() {
        sudo zypper refresh
        sudo zypper install -y wget curl git python3 python3-pip gcc make flatpak htop
    }

    if command -v apt &> /dev/null; then
        instalar_apt
    elif command -v pacman &> /dev/null; then
        instalar_pacman
    elif command -v dnf &> /dev/null; then
        instalar_dnf
    elif command -v zypper &> /dev/null; then
        instalar_zypper
    else
        echo -e "${RED}No se pudo detectar el gestor de paquetes automáticamente.${NC}"
        echo "Por favor, instale los componentes manualmente."
    fi

    echo ""
    echo -e "${GREEN}Proceso de instalación de componentes esenciales finalizado.${NC}"

else
    echo -e "${RED}Instalación cancelada por el usuario.${NC}"
fi
