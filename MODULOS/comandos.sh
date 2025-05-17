#!/bin/bash

# Creado por BlackSec

# === COLORES ===
verde="\e[1;32m"
azul="\e[1;34m"
rojo="\e[1;31m"
amarillo="\e[1;33m"
reset="\e[0m"


mostrar_firma() {
    echo -e "${rojo}=======================================${reset}"
    echo -e "${rojo}=    ▖ ▄▖▖ ▖▖▖▖▖  ▄▖▄▖▖  ▖▄▖▖ ▖▄ ▄▖   =${reset}"
    echo -e "${rojo}=    ▌ ▐ ▛▖▌▌▌▚▘  ▌ ▌▌▛▖▞▌▌▌▛▖▌▌▌▚    =${reset}"
    echo -e "${rojo}=    ▙▖▟▖▌▝▌▙▌▌▌  ▙▖▙▌▌▝ ▌▛▌▌▝▌▙▘▄▌   =${reset}"
    echo -e "${rojo}=                                     =${reset}"
    echo -e "${rojo}=                Creado por BlackSec  =${reset}"
    echo -e "${rojo}=======================================${reset}"
    
}

mostrar_firma


clear
mostrar_firma
echo -e "${verde}Comandos básicos de Linux:${reset}"
echo -e "${verde}--------------------------${reset}"
echo ""
echo "ls        -> Lista los archivos y carpetas"
echo "cd        -> Cambia de directorio"
echo "pwd       -> Muestra el directorio actual"
echo "cp        -> Copia archivos o carpetas"
echo "mv        -> Mueve o renombra archivos"
echo "rm        -> Elimina archivos"
echo "mkdir     -> Crea un nuevo directorio"
echo "cat       -> Muestra el contenido de un archivo"
echo "nano      -> Editor de texto en terminal"
echo ""
