#!/bin/bash

# Define the paths for clarity
TEMPLATE_PATH="/tmp/redis.conf.template"
CONFIG_PATH="/tmp/redis.conf"

# Pass the arguments as environment variables
PORT="${PORT:-6379}"
REDIS_PASSWORD="${REDIS_PASSWORD}"
REDIS_MASTER_PASSWORD="${REDIS_MASTER_PASSWORD}"

# Check if the template file exists before proceeding
if [ ! -f "$TEMPLATE_PATH" ]; then
    echo "Error: Configuration template not found at $TEMPLATE_PATH" >&2
    exit 1
fi

# Use envsubst to process the template with absolute paths
envsubst < "$TEMPLATE_PATH" > "$CONFIG_PATH"

# Execute the main command
exec "$@"
