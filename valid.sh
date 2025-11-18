#!/bin/bash

FILE="$HOME/etc/hosts"
if [ ! -f "$FILE" ]; then
    echo "Fișierul $FILE nu există!"
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