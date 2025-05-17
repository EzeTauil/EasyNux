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
echo "touch     -> Crea un archivo vacío"
echo "clear     -> Limpia la terminal"
echo "history   -> Muestra historial de comandos"
echo "man       -> Muestra el manual de un comando (ej: man ls)"
echo "chmod     -> Cambia permisos de archivo"
echo "chown     -> Cambia propietario de archivo"
echo "df -h     -> Muestra el uso del disco"
echo "du -sh    -> Muestra el tamaño de una carpeta"
echo "top       -> Muestra procesos en tiempo real"
echo "htop      -> Monitor de recursos (más visual)"
echo "ps aux    -> Lista todos los procesos"
echo "kill PID  -> Finaliza un proceso por su ID"
echo "wget URL  -> Descarga un archivo de internet"
echo "curl URL  -> Conecta a sitios o APIs desde terminal"
echo "sudo      -> Ejecuta comandos como administrador"
echo "apt update  -> Actualiza lista de paquetes"
echo "apt upgrade  -> Instala actualizaciones"
echo "apt install X  -> Instala un paquete"
echo "apt remove X   -> Elimina un paquete"
echo ""
