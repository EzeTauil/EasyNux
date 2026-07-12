#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

clear

# === OPCIÓN 1: Activar y configurar firewall (UFW) ===
echo -e "${YELLOW}Activando y configurando el firewall UFW...${RESET}"

if ! command -v ufw &>/dev/null; then
    echo -e "${YELLOW}Instalando UFW...${RESET}"
    instalar_paquete ufw
fi

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose

echo -e "\n${GREEN}Firewall activado y configurado correctamente.${RESET}"
echo -ne "\n${YELLOW}Presiona Enter para volver al menú...${RESET}"
read
