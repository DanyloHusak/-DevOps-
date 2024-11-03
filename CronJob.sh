#!/bin/bash

LOG_FILE="/var/log/my-app.log"

LAST_MOD_FILE="/tmp/my-app-last-modified"

REDIS_HOST="localhost"
REDIS_PORT="6379"
REDIS_KEY="myapp:log_info"

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Файл $LOG_FILE не знайдено."
    exit 1
fi

current_mod_time=$(stat -c %Y "$LOG_FILE")

if [[ -f "$LAST_MOD_FILE" ]]; then
    last_mod_time=$(cat "$LAST_MOD_FILE")
else
    last_mod_time=0
fi

if [[ "$current_mod_time" -ne "$last_mod_time" ]]; then
    file_size=$(stat -c %s "$LOG_FILE")
    modification_date=$(stat -c %y "$LOG_FILE")

    redis-cli -h "$REDIS_HOST" -p "$REDIS_PORT" HMSET "$REDIS_KEY" \
        "size" "$file_size" \
        "last_modified" "$modification_date"

    echo "$current_mod_time" > "$LAST_MOD_FILE"
fi