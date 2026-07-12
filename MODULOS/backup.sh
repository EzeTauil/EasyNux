#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

clear

echo -e "${YELLOW}Creación de backup:${RESET}"
echo ""
echo "Esta opción genera un respaldo comprimido de tus archivos de configuración personal"
echo "(dotfiles en tu carpeta de usuario) y un listado de los paquetes instalados,"
echo "para que puedas restaurar tu sistema o migrarlo fácilmente."
echo ""

DESTINO_DEFAULT="$HOME/EasyNux-backups"
read -p "¿Dónde querés guardar el backup? [$DESTINO_DEFAULT]: " destino
destino="${destino:-$DESTINO_DEFAULT}"
mkdir -p "$destino"

FECHA=$(date '+%Y-%m-%d_%H-%M-%S')
NOMBRE_BACKUP="easynux-backup-$FECHA"
DIR_TEMP=$(mktemp -d)

echo ""
echo -e "${YELLOW}Recolectando archivos de configuración...${RESET}"
mkdir -p "$DIR_TEMP/dotfiles"
(
    cd "$HOME" || exit 1
    for archivo in .bashrc .bash_profile .profile .zshrc .gitconfig .vimrc; do
        [ -e "$archivo" ] && cp -r --parents "$archivo" "$DIR_TEMP/dotfiles/" 2>/dev/null
    done
)

echo -e "${YELLOW}Guardando listado de paquetes instalados...${RESET}"
if command -v dpkg &>/dev/null; then
    dpkg --get-selections > "$DIR_TEMP/paquetes-dpkg.txt"
elif command -v pacman &>/dev/null; then
    pacman -Qqe > "$DIR_TEMP/paquetes-pacman.txt"
elif command -v dnf &>/dev/null; then
    dnf list installed > "$DIR_TEMP/paquetes-dnf.txt"
elif command -v zypper &>/dev/null; then
    zypper se --installed-only > "$DIR_TEMP/paquetes-zypper.txt"
fi

echo -e "${YELLOW}Comprimiendo backup...${RESET}"
if tar -czf "$destino/$NOMBRE_BACKUP.tar.gz" -C "$DIR_TEMP" .; then
    echo -e "${GREEN}¡Backup creado correctamente en $destino/$NOMBRE_BACKUP.tar.gz!${RESET}"
else
    echo -e "${RED}Ocurrió un error al crear el backup.${RESET}"
fi

rm -rf "$DIR_TEMP"

echo ""
echo -ne "${YELLOW}Presiona Enter para volver al menú...${RESET}"
read
