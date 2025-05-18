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

# === SUBMENÚ: ZONA GAMER ===
menu_gamer() {
    while true; do
        clear
        mostrar_banner
        echo -e "${BLUE}========= Zona Gamer =========${NC}"
        echo -e "${BLUE}1)${NC} Instalar drivers de video"
        echo -e "${BLUE}2)${NC} Instalar Steam"
        echo -e "${BLUE}3)${NC} Instalar Discord"
        echo -e "${BLUE}4)${NC} Instalar OBS(Para stream y grabación)"
        echo -e "${BLUE}5)${NC} Instalar GIMP(Crear Banners u Overlays)"
        echo -e "${BLUE}6)${NC} Instalar Kdenlive(Edición de video)"
        echo -e "${BLUE}7)${NC} Volver al menú principal"
        echo -ne "${YELLOW}Selecciona una opción [1-7]: ${NC}"
        read subopcion

        case $subopcion in
            1) bash ./MODULOS/optlinuxV2.sh ;;
            2) bash ./MODULOS/inststeam.sh ;;
            3) bash ./MODULOS/instdiscord.sh ;;
            4) bash ./MODULOS/instobs.sh ;;
            5) bash ./MODULOS/instgimp.sh ;;
            6) bash ./MODULOS/instkdenlive.sh ;;
            7) break ;;

            4) break ;;
            *) echo -e "${RED}Opción inválida.${NC}"; sleep 2 ;;
        esac
        echo -ne "${GREEN}Presiona Enter para continuar...${NC}"
        read
    done
}

# === SUBMENÚ: SOFTWARE GENERAL ===
menu_software() {
    while true; do
        clear
        mostrar_banner
        echo -e "${BLUE}======= Software General =======${NC}"
        echo -e "${BLUE}1)${NC} Actualizar el sistema"
        echo -e "${BLUE}2)${NC} Instalar herramientas esenciales"
        echo -e "${BLUE}3)${NC} Volver al menú principal"
        echo -ne "${YELLOW}Selecciona una opción [1-3]: ${NC}"
        read subopcion

        case $subopcion in
            1) bash ./MODULOS/updateSyst.sh ;;
            2) bash ./MODULOS/esenciales.sh ;;
            3) break ;;
            *) echo -e "${RED}Opción inválida.${NC}"; sleep 2 ;;
        esac
        echo -ne "${GREEN}Presiona Enter para continuar...${NC}"
        read
    done
}

# === SUBMENÚ: INFORMACIÓN Y COMANDOS ===
menu_info() {
    while true; do
        clear
        mostrar_banner
        echo -e "${BLUE}==== Diagnóstico y Aprendizaje ====${NC}"
        echo -e "${BLUE}1)${NC} Ver información del sistema"
        echo -e "${BLUE}2)${NC} Aprender comandos básicos"
        echo -e "${BLUE}3)${NC} Diagnóstico del sistema"
        echo -e "${BLUE}4)${NC} Volver al menú principal"
        echo -ne "${YELLOW}Selecciona una opción [1-4]: ${NC}"
        read subopcion

        case $subopcion in
            1) bash ./MODULOS/check.sh ;;
            2) bash ./MODULOS/comandos.sh ;;
            3) bash ./MODULOS/diagnostic.sh ;;
            4) break ;;
            *) echo -e "${RED}Opción inválida.${NC}"; sleep 2 ;;
        esac
        echo -ne "${GREEN}Presiona Enter para continuar...${NC}"
        read
    done
}

# === SUBMENÚ: Seguridad y Mantenimiento ===
menu_seguridad() {
    while true; do
        clear
        mostrar_banner
        echo -e "${BLUE}==== Seguridad y Mantenimiento ====${NC}"
        echo -e "${BLUE}1)${NC} Activar y configurar firewall (UFW)"
        echo -e "${BLUE}2)${NC} Limpiar el sistema"
        echo -e "${BLUE}3)${NC} Crear backup "
        echo -e "${BLUE}4)${NC} Volver al menú principal"
        echo -ne "${YELLOW}Selecciona una opción [1-4]: ${NC}"
        read subopcion

        case $subopcion in
            1) bash ./MODULOS/secure.sh ;;
            2) bash ./MODULOS/clearsys.sh ;;
            3) bash ./MODULOS/backup.sh ;;
            4) break ;;
            *) echo -e "${RED}Opción inválida.${NC}"; sleep 2 ;;
        esac
        echo -ne "${GREEN}Presiona Enter para continuar...${NC}"
        read
    done
}


# === MENÚ PRINCIPAL NUEVO ===
while true; do
    mostrar_banner
    echo -e "${BLUE}==================================================${NC}"
    echo -e "${BLUE}                                                  ${NC}"
    echo -e "${GREEN}¡D O M I N A - L I N U X - P A S O - A - P A S O!${NC}"
    echo -e "${BLUE}                                                  ${NC}"
    echo -e "${BLUE}==================================================${NC}"
    echo ""
    echo -e "${YELLOW}Selecciona una zona para comenzar:${NC}"
    echo ""
    echo -e "${BLUE}1)${NC} Zona de software general"
    echo -e "${BLUE}2)${NC} Zona gamer"
    echo -e "${BLUE}3)${NC} Diagnóstico y aprendizaje"
    echo -e "${BLUE}4)${NC} Seguridad y Mantenimiento"
    echo -e "${BLUE}5)${NC} Actualizar EasyNux"
    echo -e "${BLUE}6)${NC} Salir"
    echo ""
    echo -ne "${YELLOW}Selecciona una opción [1-6]: ${NC}"
    read opcion

    case $opcion in
        1) menu_software ;;
        2) menu_gamer ;;
        3) menu_info ;;
        4) menu_seguridad ;;
        5) bash ./MODULOS/EasyNuxUP.sh
           echo -ne "${GREEN}Presiona Enter para volver al menú...${NC}"
           read
           ;;
        6) echo -e "${BLUE}Gracias por usar EasyNux. ¡Hasta pronto!${NC}"; exit 0 ;;
        *) echo -e "${RED}Opción inválida. Por favor ingrese un número válido.${NC}"; sleep 2 ;;
    esac
done

