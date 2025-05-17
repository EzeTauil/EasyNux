#!/bin/bash

# Creado por BlackSec

# === COLORES ===
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # 

clear
echo -e "${YELLOW}Actualización del sistema:${NC}"
echo ""
echo "Actualizar el sistema operativo es fundamental para mantener la seguridad,"
echo "estabilidad y rendimiento de tu equipo."
echo ""
echo "Este proceso buscará las últimas actualizaciones disponibles e instalará"
echo "automáticamente todos los paquetes necesarios."
echo ""
echo -e "${YELLOW}Iniciando actualización...${NC}"
sleep 3

# Funciones según gestor de paquetes
actualizar_apt() {
    sudo apt update && sudo apt upgrade -y
}

actualizar_pacman() {
    sudo pacman -Syu --noconfirm
}

actualizar_dnf() {
    sudo dnf upgrade --refresh -y
}

actualizar_zypper() {
    sudo zypper refresh && sudo zypper update -y
}

# Detección automática
if command -v apt &> /dev/null; then
    actualizar_apt
elif command -v pacman &> /dev/null; then
    actualizar_pacman
elif command -v dnf &> /dev/null; then
    actualizar_dnf
elif command -v zypper &> /dev/null; then
    actualizar_zypper
else
    echo -e "${RED}No se pudo detectar el gestor de paquetes automáticamente.${NC}"
    echo "Por favor, actualice su sistema manualmente."
fi

echo ""
echo -e "${GREEN}Actualización completada exitosamente.${NC}"
