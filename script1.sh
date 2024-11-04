#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <шлях> <розширення>"
    exit 1
fi

path=$1
extension=$2

find "$path" -type f -name "*.$extension"

