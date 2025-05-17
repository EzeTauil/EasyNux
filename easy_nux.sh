#!/bin/bash

# Creado por BlackSec

# === COLORES ===
GREEN="\e[1;32m"
BLUE="\e[1;34m"
RED="\e[1;31m"
YELLOW="\e[1;33m"
CYAN="\e[1;36m"
PURPLE="\e[1;35m"
GRAY="\e[1;30m"
WHITE="\e[1;37m"
NC='\033[0m' 

# === MOSTRAR BANNER ===
mostrar_banner() {
    clear
    echo -e "${CYAN}"
    echo "      ███████╗ █████╗ ███████╗██╗   ██╗     ███╗   ██╗██╗   ██╗██╗  ██╗ "
    echo "      ██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝     ████╗  ██║██║   ██║╚██╗██╔╝ "
    echo "      █████╗  ███████║███████╗ ╚████╔╝█████╗██╔██╗ ██║██║   ██║ ╚███╔╝  "
    echo "      ██╔══╝  ██╔══██║╚════██║  ╚██╔╝ ╚════╝██║╚██╗██║██║   ██║ ██╔██╗  "
    echo "      ███████╗██║  ██║███████║   ██║        ██║ ╚████║╚██████╔╝██╔╝ ██╗ "
    echo "                                                     by: BlackSec       "
    echo -e "${NC}"
}

# ===  MOSTRAR EL MENÚ ===
mostrar_menu() {
    echo -e "${BLUE}==================================================${NC}"
    echo -e "${BLUE}                                                  ${NC}"
    echo -e "${GREEN}¡D O M I N A - L I N U X - P A S O - A - P A S O!${NC}"
    echo -e "${BLUE}                                                  ${NC}"
    echo -e "${BLUE}==================================================${NC}"
    echo ""
    echo -e "${YELLOW}Por favor, selecciona una opción:${NC}"
    echo ""
    echo -e "${BLUE}1)${NC} Actualizar el sistema"
    echo -e "${BLUE}2)${NC} Actualizar extenciones esenciales"
    echo -e "${BLUE}3)${NC} Instalar drivers de video"
    echo -e "${BLUE}4)${NC} Chequear informaciòn del sistema"
    echo -e "${BLUE}5)${NC} Aprender comandos bàsicos"
    echo -e "${BLUE}6)${NC} Actualizar EasyNux"
    echo -e "${BLUE}7)${NC} Salir"
    echo ""
}

# === BUCLE PRINCIPAL ===
while true; do
    mostrar_banner
    mostrar_menu
    echo -ne "${YELLOW}Selecciona una opción [1-7]:${NC}"
    read opcion

    case $opcion in
        1)
            echo -e "${GREEN}Iniciando actualización del sistema...${NC}"
            bash ./MODULOS/updateSyst.sh
            echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        2)
            echo -e "${GREEN}Iniciando instalación de esenciales...${NC}"
            bash ./MODULOS/esenciales.sh
            echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        3)
            echo -e "${GREEN}Iniciando instalación de drivers de video...${NC}"
            bash ./MODULOS/optlinuxV2.sh
            echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        4)
            echo -e "${GREEN}Obteniendo información del sistema...${NC}"
            bash ./MODULOS/check.sh
            echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        5)
            echo -e "${GREEN}Mostrando comandos básicos de Linux...${NC}"
            bash ./MODULOS/comandos.sh
            echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        6)
            echo -e "${BLUE}Buscando actualizaciones de EasyNux...${NC}"
            bash ./MODULOS/EasyNuxUP.sh
            echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
            read
            ;;

        7)  echo -e "${BLUE}Gracias por usar EasyNux. ¡Hasta pronto!${NC}"
            exit 0
            ;;

        *)
            echo -e "${RED}Opción inválida. Por favor ingrese un número válido.${NC}"
            sleep 2
            ;;
    esac
done
