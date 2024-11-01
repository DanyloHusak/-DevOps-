#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <шлях> <розширення>"
    exit 1
fi

path=$1
extension=$2

count=$(find "$path" -type f -name "*.$extension" | wc -l)
echo "Кількість файлів із розширенням .$extension у директорії $path: $count"