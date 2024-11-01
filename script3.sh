#!/bin/bash

path=""
text=""

while getopts "p:s:" opt; do
  case $opt in
    p) path=$OPTARG ;;
    s) text=$OPTARG ;;
    *) echo "Використання: $0 -p <шлях> -s <текст>"
       exit 1 ;;
  esac
done

if [ -z "$path" ] || [ -z "$text" ]; then
    echo "Використання: $0 -p <шлях> -s <текст>"
    exit 1
fi

grep -rl "$text" "$path"