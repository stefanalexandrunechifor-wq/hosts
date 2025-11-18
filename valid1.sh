#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Utilizare: $0 <fisier_hosts>"
    exit 1
fi
FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Eroare: fișierul '$FILE' nu există!"
    exit 1
fi
while read -r ip host; do
    [[ "$ip" =~ ^#.*$ || -z "$ip" ]] && continue

    if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "OK: $ip este valid"
    else
        echo "INVALID: $ip"
    fi
done < "$FILE"