#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <шлях> <текст>"
    exit 1
fi

path=$1
text=$2

grep -rl "$text" "$path"