#!/bin/bash

# Creado por BlackSec

# Función para escanear archivos .exe
scan_exe_files() {
    echo -e "\e[1;31m=== Archivos .exe ===\e[0m"
    exe_files=$(find / -type f -name "*.exe" 2>/dev/null)
    if [ -z "$exe_files" ]; then
        echo "No se encontraron archivos ejecutables anómalos."
    else
        echo "$exe_files"
    fi
}

# Bucle principal
while true; do
    # Menú interactivo
    echo -e "\e[1;34m==========================================\e[0m"
    echo -e "\e[1;34m==                                      ==\e[0m"
    echo -e "\e[1;34m==   ▄▖▖▖▄▖▄▖▖▖  ▄▖▄▖  ▄▖▖▖▄▖▄▖▄▖▖  ▖   ==\e[0m"
    echo -e "\e[1;34m==   ▌ ▙▌▙▖▌ ▙▘  ▌▌▙▖  ▚ ▌▌▚ ▐ ▙▖▛▖▞▌   ==\e[0m"
    echo -e "\e[1;34m==   ▙▖▌▌▙▖▙▖▌▌  ▙▌▌   ▄▌▐ ▄▌▐ ▙▖▌▝ ▌   ==\e[0m"
    echo -e "\e[1;34m==                                      ==\e[0m"
    echo -e "\e[1;34m==                    by:BlackSec       ==\e[0m"
    echo -e "\e[1;34m==========================================\e[0m"       
    echo -e "\e[1;36m===Seleccione una opción:\e[0m"
    echo -e "\e[1;35m1. Consumo de recursos\e[0m"
    echo -e "\e[1;35m2. Conexiones de red\e[0m"
    echo -e "\e[1;35m3. Procesos inusuales\e[0m"
    echo -e "\e[1;35m4. Archivos .exe\e[0m"
    echo -e "\e[1;35m5. Archivos SUID/SGID\e[0m"
    echo -e "\e[1;35m6. Archivos con permisos inusuales\e[0m"
    echo -e "\e[1;35m7. Archivos con configuraciones sensibles\e[0m"
    echo -e "\e[1;35m8. Cambios en archivos de configuración\e[0m"
    echo -e "\e[1;35m9. Conexiones SSH activas\e[0m"
    echo -e "\e[1;35m10. Usuarios inactivos\e[0m"
    echo -e "\e[1;35m11. Usuarios conectados\e[0m"
    echo -e "\e[1;35m12. Salir\e[0m"

     read -p $'\e[1;33m===Ingrese el número de opción deseado: \e[0m' option

    case $option in
        1) echo -e "\e[1;36m=== Consumo de recursos ===\e[0m"
           top -b -n 1 | head -n 20 ;;
        2) echo -e "\e[1;36m=== Conexiones de red ===\e[0m"
           netstat -tuln ;;
        3) echo -e "\e[1;36m=== Procesos inusuales ===\e[0m"
           ps aux --sort=-%cpu,%mem | head -n 20 ;;
        4) scan_exe_files ;;
        5) echo -e "\e[1;36m=== Archivos SUID/SGID ===\e[0m"
           find / \( -perm -4000 -o -perm -2000 \) -type f -exec ls -l {} \; ;;
        6) echo -e "\e[1;36m=== Archivos con permisos inusuales ===\e[0m"
           files=$(find / -type f ! -perm -o=rwx 2>/dev/null)
           if [ -z "$files" ]; then
               echo "No se encontraron archivos con permisos inusuales."
           else
               echo "$files"
           fi ;;
        7) echo -e "\e[1;36m=== Archivos con configuraciones sensibles ===\e[0m"
           files=$(grep -r -iE 'password|passwd|secret|api_key' /etc /var 2>/dev/null)
           if [ -z "$files" ]; then
               echo "No se encontraron archivos con configuraciones sensibles."
           else
               echo "$files"
           fi ;;
        8) echo -e "\e[1;36m=== Cambios en archivos de configuración ===\e[0m"
           files=$(find /etc /var -type f -name "*.conf" -mtime -1 2>/dev/null)
           if [ -z "$files" ]; then
               echo "No se encontraron cambios en archivos de configuración."
           else
               echo "$files"
           fi ;;
        9) echo -e "\e[1;36m=== Conexiones SSH activas ===\e[0m"
           connections=$(netstat -tuln | grep ':22')
           if [ -z "$connections" ]; then
               echo "No se encontraron conexiones SSH activas."
           else
               echo "$connections"
           fi ;;
        10) echo -e "\e[1;36m=== Usuarios inactivos ===\e[0m"
            inactive_users=$(lastlog | grep -v "Never")
            if [ -z "$inactive_users" ]; then
                echo "No se encontraron usuarios inactivos."
            else
                echo "$inactive_users"
            fi ;;
        11) echo -e "\e[1;36m=== Usuarios conectados ===\e[0m"
            users=$(w)
            if [ -z "$users" ]; then
                echo "No se encontraron usuarios conectados."
            else
                echo "$users"
            fi ;;
        12) echo "Cerrando el programa..."
            exit ;;
        *) echo "Opción no válida." ;;
    esac

    sleep 3  # Pausa de 3 segundos
done


