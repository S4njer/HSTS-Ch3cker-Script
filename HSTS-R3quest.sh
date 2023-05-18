#!/bin/bash

# Colores
COLOR_ROJO='\033[0;31m'
COLOR_VERDE='\033[0;32m'
COLOR_AMARILLO='\033[0;33m'
COLOR_RESET='\033[0m'

# Archivo de direcciones IP
archivo_direcciones="ip-addr.txt"

# Archivo de resultados
archivo_resultados="resultados-R3quests.txt"

# Verificar si el archivo de direcciones existe
if [ ! -f "$archivo_direcciones" ]; then
    echo -e "${COLOR_ROJO}[-] El archivo de direcciones \"$archivo_direcciones\" no existe.${COLOR_RESET}"
    exit 1
fi

# Limpiar archivo de resultados
> "$archivo_resultados"

# Leer direcciones IP del archivo
while IFS= read -r direccion_ip; do
    echo -e "${COLOR_AMARILLO}[*] Comprobando HSTS para $direccion_ip (HTTP)...${COLOR_RESET}"
    resultado_http=$(curl -sI "http://$direccion_ip" | grep -i "Strict-Transport-Security")
    echo -e "Dirección IP: $direccion_ip (HTTP)" >> "$archivo_resultados"
    echo "$resultado_http" >> "$archivo_resultados"

    echo -e "${COLOR_AMARILLO}[*] Comprobando HSTS para $direccion_ip (HTTPS)...${COLOR_RESET}"
    resultado_https=$(curl -sI "https://$direccion_ip" | grep -i "Strict-Transport-Security")
    echo -e "Dirección IP: $direccion_ip (HTTPS)" >> "$archivo_resultados"
    echo "$resultado_https" >> "$archivo_resultados"

    if [ -z "$resultado_http" ] && [ -z "$resultado_https" ]; then
        echo -e "${COLOR_VERDE}[+] No se ha encontrado \"HTTP Strict Transport Security (HSTS)\" en $direccion_ip.${COLOR_RESET}"
        echo -e "[+] No se ha encontrado \"HTTP Strict Transport Security (HSTS)\" en $direccion_ip." >> "$archivo_resultados"
    fi

    echo -e ""
done < "$archivo_direcciones"

echo -e "${COLOR_VERDE}[+] Comprobación finalizada. Los resultados se han guardado en \"$archivo_resultados\".${COLOR_RESET}"
