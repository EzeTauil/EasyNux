#!/bin/bash

# === COLORES ===
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
RESET="\e[0m"

clear
echo -e "${YELLOW}Actualización de EasyNux:${RESET}"
echo ""
echo -e "${GREEN}Esta función buscará la última versión de EasyNux desde GitHub y actualizará todos los módulos.${RESET}"
echo ""
sleep 1

if [ -d .git ]; then
    echo -e "${GREEN}Repositorio Git detectado.${RESET}"
    echo -e "${YELLOW}Comprobando actualizaciones...${RESET}"
    sleep 1

    if git pull --quiet; then
        echo -e "${GREEN}EasyNux ha sido actualizado exitosamente.${RESET}"
    else
        echo -e "${RED}Error al actualizar. Verifica tu conexión o los permisos del repositorio.${RESET}"
    fi
else
    echo -e "${RED}Este directorio no es un repositorio Git.${RESET}"
    echo -e "Para activar esta función, debes clonar EasyNux desde GitHub usando:"
    echo -e "${YELLOW}git clone https://github.com/EzeTauil/EasyNux.git${RESET}"
    echo ""
    echo -e "O si ya lo subiste, ubicá EasyNux dentro del repositorio clonado para habilitar las actualizaciones automáticas."
fi

echo ""
echo -ne "${YELLOW}Presiona Enter para volver al menú...${RESET}"
read
