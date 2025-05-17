#!/bin/bash

# Optimizador Linux Gaming 
# Creado por BlackSec

clear

# Colores
verde="\e[1;32m"
azul="\e[1;34m"
rojo="\e[1;31m"
amarillo="\e[1;33m"
cyan="\e[1;36m"
violeta="\e[1;35m"
gris="\e[1;30m"
blanco="\e[1;37m"
reset="\e[0m"

# Archivo de log
logfile="$HOME/optimizador-linux-gaming.log"
echo "" > "$logfile"

# Firma
mostrar_firma() {
    echo -e "${verde}=======================================${reset}"
    echo -e "${verde}=    ▖ ▄▖▖ ▖▖▖▖▖  ▄▖▄▖▖  ▖▄▖▖ ▖▄▖     =${reset}"
    echo -e "${verde}=    ▌ ▐ ▛▖▌▌▌▚▘  ▌ ▌▌▛▖▞▌▐ ▛▖▌▌      =${reset}"
    echo -e "${verde}=    ▙▖▟▖▌▝▌▙▌▌▌  ▙▌▛▌▌▝ ▌▟▖▌▝▌▙▌     =${reset}" 
    echo -e "${verde}=                Creado por BlackSec  =${reset}"
    echo -e "${verde}=======================================${reset}"
    echo -e "${violeta}¡POTENCIANDO TU EXPERIENCIA GAMER EN LINUX! 🎮🐧${reset}"
}

mostrar_firma

# Funciones basicas
chequear_paquete() {
    dpkg -l | grep -qw "$1"
}

registrar_log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$logfile"
}

detectar_gpu() {
    GPU_INFO=$(lspci | grep -i 'vga\|3d\|2d')
    registrar_log "GPU detectada: $GPU_INFO"
    echo "$GPU_INFO"
}

detectar_cpu() {
    CPU_INFO=$(cat /proc/cpuinfo | grep 'model name' | uniq | awk -F: '{print $2}' | sed 's/^ //')
    registrar_log "CPU detectada: $CPU_INFO"
    echo "$CPU_INFO"
}

detectar_ram() {
    RAM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
    registrar_log "RAM detectada: $RAM_TOTAL"
    echo "$RAM_TOTAL"
}

detectar_disco() {
    DISCO_INFO=$(lsblk -d -o name,rota | grep ' 0' | awk '{print $1}' | head -n 1)
    if [ -n "$DISCO_INFO" ]; then
        registrar_log "Disco detectado: SSD ($DISCO_INFO)"
        echo "SSD ($DISCO_INFO)"
    else
        DISCO_INFO=$(lsblk -d -o name,rota | grep ' 1' | awk '{print $1}' | head -n 1)
        if [ -n "$DISCO_INFO" ]; then
            registrar_log "Disco detectado: HDD ($DISCO_INFO)"
            echo "HDD ($DISCO_INFO)"
        else
            registrar_log "Disco no detectado"
            echo "No se pudo detectar"
        fi
    fi
}

mostrar_resumen_hardware() {
    echo -e "${verde}===========================================${reset}"
    echo -e "| Componente        | Estado Inicial    |"
    echo -e "${verde}===========================================${reset}"
    echo -e "| CPU               | $(detectar_cpu)"
    echo -e "| GPU               | $(detectar_gpu)"
    echo -e "| RAM Total         | $(detectar_ram)"
    echo -e "| Disco Principal   | $(detectar_disco)"
    echo -e "${verde}===========================================${reset}"
}

test_rendimiento() {
    echo -e "${azul}Preparando test de rendimiento...${reset}"
    if ! command -v glmark2 &> /dev/null; then
        echo -e "${amarillo}glmark2 no encontrado, instalando...${reset}"
        sudo apt update
        sudo apt install glmark2 -y
    fi
    echo -e "${verde}Iniciando test de rendimiento...${reset}"
    glmark2 | tee "$HOME/glmark2_resultado.log"
    SCORE=$(grep "glmark2 Score" "$HOME/glmark2_resultado.log")
    echo -e "${azul}$SCORE${reset}"
    registrar_log "Resultado de glmark2: $SCORE"
}

# Funciones de instalacion segura
instalar_paquete() {
    if sudo apt install "$1" -y; then
        echo -e "${verde}$1 instalado correctamente.${reset}"
        registrar_log "$1 instalado."
    else
        echo -e "${rojo}Error instalando $1.${reset}"
        registrar_log "Error instalando $1."
    fi
}

instalar_gamemode() {
    if chequear_paquete gamemode; then
        echo -e "${amarillo}GameMode ya esta instalado.${reset}"
        registrar_log "GameMode ya estaba instalado."
    else
        instalar_paquete gamemode
    fi
}

instalar_mangohud() {
    if chequear_paquete mangohud; then
        echo -e "${amarillo}MangoHud ya esta instalado.${reset}"
        registrar_log "MangoHud ya estaba instalado."
    else
        instalar_paquete mangohud
    fi
}

instalar_protonup() {
    if flatpak list | grep -qw net.davidotek.pupgui2; then
        echo -e "${amarillo}ProtonUp-Qt ya esta instalado.${reset}"
        registrar_log "ProtonUp-Qt ya estaba instalado."
    else
        if ! command -v flatpak &> /dev/null; then
            instalar_paquete flatpak
        fi
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        sudo flatpak install flathub net.davidotek.pupgui2 -y
        echo -e "${verde}ProtonUp-Qt instalado correctamente!${reset}"
        registrar_log "ProtonUp-Qt instalado."
    fi
}

# Funciones gaming avanzado
instalar_lutris() {
    echo -e "${azul}Instalando Lutris...${reset}"
    flatpak install flathub net.lutris.Lutris -y && registrar_log "Lutris instalado." || registrar_log "Error instalando Lutris."
}

instalar_heroic() {
    echo -e "${azul}Instalando Heroic Games Launcher...${reset}"
    flatpak install flathub com.heroicgameslauncher.hgl -y && registrar_log "Heroic instalado." || registrar_log "Error instalando Heroic."
}

instalar_dxvk() {
    echo -e "${azul}Instalando Wine (para DXVK)...${reset}"
    flatpak install flathub org.winehq.Wine -y && registrar_log "Wine/DXVK instalado." || registrar_log "Error instalando Wine/DXVK."
}

# Funcion para detectar y ofrecer instalar drivers NVIDIA
detectar_e_instalar_driver_nvidia() {
    echo -e "${azul}Buscando el último driver NVIDIA disponible...${reset}"
    ULTIMO_DRIVER=$(apt-cache policy | grep nvidia-driver | grep -o 'nvidia-driver-[0-9]\+' | sort -V | tail -n1)

    if [ -n "$ULTIMO_DRIVER" ]; then
        echo -e "${verde}Driver detectado: $ULTIMO_DRIVER${reset}"
        read -p "¿Deseas instalar $ULTIMO_DRIVER? (s/n): " respuesta_driver
        if [ "$respuesta_driver" = "s" ]; then
            sudo apt install "$ULTIMO_DRIVER" -y && registrar_log "$ULTIMO_DRIVER instalado." || registrar_log "Error instalando $ULTIMO_DRIVER."
        fi
    else
        echo -e "${rojo}No se encontró un driver NVIDIA disponible.${reset}"
        read -p "¿Deseas agregar el repositorio oficial de NVIDIA para buscar más drivers? (s/n): " respuesta_ppa
        if [ "$respuesta_ppa" = "s" ]; then
            sudo add-apt-repository ppa:graphics-drivers/ppa -y && sudo apt update
            detectar_e_instalar_driver_nvidia
        fi
    fi
}

chequear_driver_gpu() {
    GPU_INFO=$(lspci | grep -i 'vga\|3d\|2d')
    if echo "$GPU_INFO" | grep -iq nvidia; then
        if ! lsmod | grep -q nvidia; then
            echo -e "${rojo}No se detecto driver NVIDIA cargado.${reset}"
            detectar_e_instalar_driver_nvidia
        fi
    fi
}

# Menu principal
while true; do
    clear
    mostrar_firma
    echo -e "${azul}¿Que quieres hacer?${reset}"
    echo -e "${verde}1)${reset} Mostrar resumen de hardware"
    echo -e "${verde}2)${reset} Test de rendimiento actual (Recomendado)"
    echo -e "${verde}3)${reset} Optimizar todo (Recomendado)"
    echo -e "${verde}4)${reset} Optimizar paso a paso"
    echo -e "${verde}5)${reset} Instalar herramientas de juegos avanzadas"
    echo -e "${verde}6)${reset} Salir"
    echo -ne "${amarillo}Selecciona una opción [1-6]: ${reset}"
    read opcion


    case $opcion in
        1)
            mostrar_resumen_hardware
            echo -ne "${cyan}Presiona Enter para volver al menu...${reset}"
            read
            ;;
        2)
            test_rendimiento
            echo -ne "${cyan}Presiona Enter para volver al menu...${reset}"
            read
            ;;
        3)
            chequear_driver_gpu
            instalar_gamemode
            instalar_mangohud
            instalar_protonup
            echo -e "${verde}Optimizacion completa!${reset}"
            registrar_log "Optimizacion completa."
            read -p "¿Deseas realizar un nuevo test de rendimiento ahora? (s/n): " respuesta
            if [ "$respuesta" = "s" ]; then
                test_rendimiento
            fi
            break
            ;;
        4)
            chequear_driver_gpu
            echo ""
            echo -e "${azul}Instalar GameMode? (s/n)${reset}"
            read respuesta
            if [ "$respuesta" = "s" ]; then instalar_gamemode; fi

            echo ""
            echo -e "${azul}Instalar MangoHud? (s/n)${reset}"
            read respuesta
            if [ "$respuesta" = "s" ]; then instalar_mangohud; fi

            echo ""
            echo -e "${azul}Instalar ProtonUp-Qt? (s/n)${reset}"
            read respuesta
            if [ "$respuesta" = "s" ]; then instalar_protonup; fi

            read -p "¿Deseas realizar un nuevo test de rendimiento ahora? (s/n): " respuesta
            if [ "$respuesta" = "s" ]; then
                test_rendimiento
            fi
            break
            ;;
        5)
           clear
            echo -e "${azul}Instalación de herramientas avanzadas para juegos:${reset}"
            echo -e "${verde}1)${reset} Instalar Lutris"
            echo -e "${verde}2)${reset} Instalar Heroic Games Launcher"
            echo -e "${verde}3)${reset} Instalar DXVK"
            echo -e "${verde}4)${reset} Instalar TODO (Lutris + Heroic + DXVK)"
            echo -e "${verde}5)${reset} Volver al menú principal"
            echo -ne "${amarillo}Selecciona una opcion [1-5]: ${reset}"
            read subopcion

            case $subopcion in
                1) instalar_lutris ;;
                2) instalar_heroic ;;
                3) instalar_dxvk ;;
                4)
                    instalar_lutris
                    instalar_heroic
                    instalar_dxvk
                    ;;

                5) ;;
                *) echo -e "${rojo}Opción inválida. Volviendo al menú principal.${reset}" ;;
            esac
            echo -ne "${cyan}Presiona Enter para volver al menu...${reset}"
            read
            ;;

        6)
            echo -e "${rojo}Saliendo del asistente...${reset}"
            registrar_log "Usuario salio del asistente."
            exit 0
            ;;
        *)
            echo -e "${rojo}Opción inválida. Intenta de nuevo.${reset}"
            sleep 2
            ;;

    esac
done

clear
mostrar_firma
echo -e "${verde}==================================${reset}"
echo "¡Optimizacion finalizada con exito!"
echo "Se ha guardado un registro en: $logfile"
echo "Recorda reiniciar Steam y probar los juegos con las nuevas mejoras."
echo -e "${verde}==================================${reset}"

exit 0
